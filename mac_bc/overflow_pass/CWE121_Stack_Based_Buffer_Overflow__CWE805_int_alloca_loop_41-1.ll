; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_badSink(i32* noundef %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !20, metadata !DIExpression()), !dbg !25
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !25
  call void @llvm.dbg.declare(metadata i64* %i, metadata !26, metadata !DIExpression()), !dbg !33
  store i64 0, i64* %i, align 8, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !37
  %cmp = icmp ult i64 %1, 100, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !40

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !41
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !43
  %3 = load i32, i32* %arrayidx, align 4, !dbg !43
  %4 = load i32*, i32** %data.addr, align 8, !dbg !44
  %5 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !44
  store i32 %3, i32* %arrayidx1, align 4, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !48
  %inc = add i64 %6, 1, !dbg !48
  store i64 %inc, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !53
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !53
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !53
  call void @printIntLine(i32 noundef %8), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printIntLine(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_bad() #0 !dbg !56 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !61, metadata !DIExpression()), !dbg !62
  %0 = alloca i8, i64 200, align 16, !dbg !63
  %1 = bitcast i8* %0 to i32*, !dbg !64
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !65, metadata !DIExpression()), !dbg !66
  %2 = alloca i8, i64 400, align 16, !dbg !67
  %3 = bitcast i8* %2 to i32*, !dbg !68
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !66
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !69
  store i32* %4, i32** %data, align 8, !dbg !70
  %5 = load i32*, i32** %data, align 8, !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_badSink(i32* noundef %5), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_goodG2BSink(i32* noundef %data) #0 !dbg !74 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !77, metadata !DIExpression()), !dbg !79
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !79
  call void @llvm.dbg.declare(metadata i64* %i, metadata !80, metadata !DIExpression()), !dbg !82
  store i64 0, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !86
  %cmp = icmp ult i64 %1, 100, !dbg !88
  br i1 %cmp, label %for.body, label %for.end, !dbg !89

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !92
  %3 = load i32, i32* %arrayidx, align 4, !dbg !92
  %4 = load i32*, i32** %data.addr, align 8, !dbg !93
  %5 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !93
  store i32 %3, i32* %arrayidx1, align 4, !dbg !95
  br label %for.inc, !dbg !96

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !97
  %inc = add i64 %6, 1, !dbg !97
  store i64 %inc, i64* %i, align 8, !dbg !97
  br label %for.cond, !dbg !98, !llvm.loop !99

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !101
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !101
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !101
  call void @printIntLine(i32 noundef %8), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_good() #0 !dbg !104 {
entry:
  call void @goodG2B(), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !107 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !113, metadata !DIExpression()), !dbg !114
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !115, metadata !DIExpression()), !dbg !116
  %call = call i64 @time(i64* noundef null), !dbg !117
  %conv = trunc i64 %call to i32, !dbg !118
  call void @srand(i32 noundef %conv), !dbg !119
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !120
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_good(), !dbg !121
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !122
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !123
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_bad(), !dbg !124
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !125
  ret i32 0, !dbg !126
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !127 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !130, metadata !DIExpression()), !dbg !131
  %0 = alloca i8, i64 200, align 16, !dbg !132
  %1 = bitcast i8* %0 to i32*, !dbg !133
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !134, metadata !DIExpression()), !dbg !135
  %2 = alloca i8, i64 400, align 16, !dbg !136
  %3 = bitcast i8* %2 to i32*, !dbg !137
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !135
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !138
  store i32* %4, i32** %data, align 8, !dbg !139
  %5 = load i32*, i32** %data, align 8, !dbg !140
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_goodG2BSink(i32* noundef %5), !dbg !141
  ret void, !dbg !142
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_badSink", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !3}
!17 = !{}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 21, type: !3)
!19 = !DILocation(line: 21, column: 82, scope: !13)
!20 = !DILocalVariable(name: "source", scope: !21, file: !14, line: 24, type: !22)
!21 = distinct !DILexicalBlock(scope: !13, file: !14, line: 23, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 24, column: 13, scope: !21)
!26 = !DILocalVariable(name: "i", scope: !27, file: !14, line: 26, type: !28)
!27 = distinct !DILexicalBlock(scope: !21, file: !14, line: 25, column: 9)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !29, line: 31, baseType: !30)
!29 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !31, line: 94, baseType: !32)
!31 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!32 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!33 = !DILocation(line: 26, column: 20, scope: !27)
!34 = !DILocation(line: 28, column: 20, scope: !35)
!35 = distinct !DILexicalBlock(scope: !27, file: !14, line: 28, column: 13)
!36 = !DILocation(line: 28, column: 18, scope: !35)
!37 = !DILocation(line: 28, column: 25, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !14, line: 28, column: 13)
!39 = !DILocation(line: 28, column: 27, scope: !38)
!40 = !DILocation(line: 28, column: 13, scope: !35)
!41 = !DILocation(line: 30, column: 34, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !14, line: 29, column: 13)
!43 = !DILocation(line: 30, column: 27, scope: !42)
!44 = !DILocation(line: 30, column: 17, scope: !42)
!45 = !DILocation(line: 30, column: 22, scope: !42)
!46 = !DILocation(line: 30, column: 25, scope: !42)
!47 = !DILocation(line: 31, column: 13, scope: !42)
!48 = !DILocation(line: 28, column: 35, scope: !38)
!49 = !DILocation(line: 28, column: 13, scope: !38)
!50 = distinct !{!50, !40, !51, !52}
!51 = !DILocation(line: 31, column: 13, scope: !35)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 32, column: 26, scope: !27)
!54 = !DILocation(line: 32, column: 13, scope: !27)
!55 = !DILocation(line: 35, column: 1, scope: !13)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_bad", scope: !14, file: !14, line: 37, type: !57, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!57 = !DISubroutineType(types: !58)
!58 = !{null}
!59 = !DILocalVariable(name: "data", scope: !56, file: !14, line: 39, type: !3)
!60 = !DILocation(line: 39, column: 11, scope: !56)
!61 = !DILocalVariable(name: "dataBadBuffer", scope: !56, file: !14, line: 40, type: !3)
!62 = !DILocation(line: 40, column: 11, scope: !56)
!63 = !DILocation(line: 40, column: 34, scope: !56)
!64 = !DILocation(line: 40, column: 27, scope: !56)
!65 = !DILocalVariable(name: "dataGoodBuffer", scope: !56, file: !14, line: 41, type: !3)
!66 = !DILocation(line: 41, column: 11, scope: !56)
!67 = !DILocation(line: 41, column: 35, scope: !56)
!68 = !DILocation(line: 41, column: 28, scope: !56)
!69 = !DILocation(line: 44, column: 12, scope: !56)
!70 = !DILocation(line: 44, column: 10, scope: !56)
!71 = !DILocation(line: 45, column: 75, scope: !56)
!72 = !DILocation(line: 45, column: 5, scope: !56)
!73 = !DILocation(line: 46, column: 1, scope: !56)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_goodG2BSink", scope: !14, file: !14, line: 52, type: !15, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!75 = !DILocalVariable(name: "data", arg: 1, scope: !74, file: !14, line: 52, type: !3)
!76 = !DILocation(line: 52, column: 86, scope: !74)
!77 = !DILocalVariable(name: "source", scope: !78, file: !14, line: 55, type: !22)
!78 = distinct !DILexicalBlock(scope: !74, file: !14, line: 54, column: 5)
!79 = !DILocation(line: 55, column: 13, scope: !78)
!80 = !DILocalVariable(name: "i", scope: !81, file: !14, line: 57, type: !28)
!81 = distinct !DILexicalBlock(scope: !78, file: !14, line: 56, column: 9)
!82 = !DILocation(line: 57, column: 20, scope: !81)
!83 = !DILocation(line: 59, column: 20, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !14, line: 59, column: 13)
!85 = !DILocation(line: 59, column: 18, scope: !84)
!86 = !DILocation(line: 59, column: 25, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !14, line: 59, column: 13)
!88 = !DILocation(line: 59, column: 27, scope: !87)
!89 = !DILocation(line: 59, column: 13, scope: !84)
!90 = !DILocation(line: 61, column: 34, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !14, line: 60, column: 13)
!92 = !DILocation(line: 61, column: 27, scope: !91)
!93 = !DILocation(line: 61, column: 17, scope: !91)
!94 = !DILocation(line: 61, column: 22, scope: !91)
!95 = !DILocation(line: 61, column: 25, scope: !91)
!96 = !DILocation(line: 62, column: 13, scope: !91)
!97 = !DILocation(line: 59, column: 35, scope: !87)
!98 = !DILocation(line: 59, column: 13, scope: !87)
!99 = distinct !{!99, !89, !100, !52}
!100 = !DILocation(line: 62, column: 13, scope: !84)
!101 = !DILocation(line: 63, column: 26, scope: !81)
!102 = !DILocation(line: 63, column: 13, scope: !81)
!103 = !DILocation(line: 66, column: 1, scope: !74)
!104 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_good", scope: !14, file: !14, line: 79, type: !57, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!105 = !DILocation(line: 81, column: 5, scope: !104)
!106 = !DILocation(line: 82, column: 1, scope: !104)
!107 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 94, type: !108, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!108 = !DISubroutineType(types: !109)
!109 = !{!4, !4, !110}
!110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !111, size: 64)
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!112 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!113 = !DILocalVariable(name: "argc", arg: 1, scope: !107, file: !14, line: 94, type: !4)
!114 = !DILocation(line: 94, column: 14, scope: !107)
!115 = !DILocalVariable(name: "argv", arg: 2, scope: !107, file: !14, line: 94, type: !110)
!116 = !DILocation(line: 94, column: 27, scope: !107)
!117 = !DILocation(line: 97, column: 22, scope: !107)
!118 = !DILocation(line: 97, column: 12, scope: !107)
!119 = !DILocation(line: 97, column: 5, scope: !107)
!120 = !DILocation(line: 99, column: 5, scope: !107)
!121 = !DILocation(line: 100, column: 5, scope: !107)
!122 = !DILocation(line: 101, column: 5, scope: !107)
!123 = !DILocation(line: 104, column: 5, scope: !107)
!124 = !DILocation(line: 105, column: 5, scope: !107)
!125 = !DILocation(line: 106, column: 5, scope: !107)
!126 = !DILocation(line: 108, column: 5, scope: !107)
!127 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 69, type: !57, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!128 = !DILocalVariable(name: "data", scope: !127, file: !14, line: 71, type: !3)
!129 = !DILocation(line: 71, column: 11, scope: !127)
!130 = !DILocalVariable(name: "dataBadBuffer", scope: !127, file: !14, line: 72, type: !3)
!131 = !DILocation(line: 72, column: 11, scope: !127)
!132 = !DILocation(line: 72, column: 34, scope: !127)
!133 = !DILocation(line: 72, column: 27, scope: !127)
!134 = !DILocalVariable(name: "dataGoodBuffer", scope: !127, file: !14, line: 73, type: !3)
!135 = !DILocation(line: 73, column: 11, scope: !127)
!136 = !DILocation(line: 73, column: 35, scope: !127)
!137 = !DILocation(line: 73, column: 28, scope: !127)
!138 = !DILocation(line: 75, column: 12, scope: !127)
!139 = !DILocation(line: 75, column: 10, scope: !127)
!140 = !DILocation(line: 76, column: 79, scope: !127)
!141 = !DILocation(line: 76, column: 5, scope: !127)
!142 = !DILocation(line: 77, column: 1, scope: !127)
