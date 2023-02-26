; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_badSink(i32* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !24
  call void @llvm.dbg.declare(metadata i64* %i, metadata !25, metadata !DIExpression()), !dbg !30
  store i64 0, i64* %i, align 8, !dbg !31
  br label %for.cond, !dbg !33

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !34
  %cmp = icmp ult i64 %1, 100, !dbg !36
  br i1 %cmp, label %for.body, label %for.end, !dbg !37

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !38
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !40
  %3 = load i32, i32* %arrayidx, align 4, !dbg !40
  %4 = load i32*, i32** %data.addr, align 8, !dbg !41
  %5 = load i64, i64* %i, align 8, !dbg !42
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !41
  store i32 %3, i32* %arrayidx1, align 4, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !45
  %inc = add i64 %6, 1, !dbg !45
  store i64 %inc, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !50
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !50
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !50
  call void @printIntLine(i32 %8), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_bad() #0 !dbg !53 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !58, metadata !DIExpression()), !dbg !59
  %0 = alloca i8, i64 200, align 16, !dbg !60
  %1 = bitcast i8* %0 to i32*, !dbg !61
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !59
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !62, metadata !DIExpression()), !dbg !63
  %2 = alloca i8, i64 400, align 16, !dbg !64
  %3 = bitcast i8* %2 to i32*, !dbg !65
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !63
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !66
  store i32* %4, i32** %data, align 8, !dbg !67
  %5 = load i32*, i32** %data, align 8, !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_badSink(i32* %5), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_goodG2BSink(i32* %data) #0 !dbg !71 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !74, metadata !DIExpression()), !dbg !76
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !76
  call void @llvm.dbg.declare(metadata i64* %i, metadata !77, metadata !DIExpression()), !dbg !79
  store i64 0, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !83
  %cmp = icmp ult i64 %1, 100, !dbg !85
  br i1 %cmp, label %for.body, label %for.end, !dbg !86

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !87
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !89
  %3 = load i32, i32* %arrayidx, align 4, !dbg !89
  %4 = load i32*, i32** %data.addr, align 8, !dbg !90
  %5 = load i64, i64* %i, align 8, !dbg !91
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !90
  store i32 %3, i32* %arrayidx1, align 4, !dbg !92
  br label %for.inc, !dbg !93

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !94
  %inc = add i64 %6, 1, !dbg !94
  store i64 %inc, i64* %i, align 8, !dbg !94
  br label %for.cond, !dbg !95, !llvm.loop !96

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !98
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !98
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !98
  call void @printIntLine(i32 %8), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_good() #0 !dbg !101 {
entry:
  call void @goodG2B(), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !104 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !110, metadata !DIExpression()), !dbg !111
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !112, metadata !DIExpression()), !dbg !113
  %call = call i64 @time(i64* null) #5, !dbg !114
  %conv = trunc i64 %call to i32, !dbg !115
  call void @srand(i32 %conv) #5, !dbg !116
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !117
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_good(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !120
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_bad(), !dbg !121
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !122
  ret i32 0, !dbg !123
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !124 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !127, metadata !DIExpression()), !dbg !128
  %0 = alloca i8, i64 200, align 16, !dbg !129
  %1 = bitcast i8* %0 to i32*, !dbg !130
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !128
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !131, metadata !DIExpression()), !dbg !132
  %2 = alloca i8, i64 400, align 16, !dbg !133
  %3 = bitcast i8* %2 to i32*, !dbg !134
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !132
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !135
  store i32* %4, i32** %data, align 8, !dbg !136
  %5 = load i32*, i32** %data, align 8, !dbg !137
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_goodG2BSink(i32* %5), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_badSink", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 21, type: !4)
!18 = !DILocation(line: 21, column: 82, scope: !13)
!19 = !DILocalVariable(name: "source", scope: !20, file: !14, line: 24, type: !21)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 23, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !DILocation(line: 24, column: 13, scope: !20)
!25 = !DILocalVariable(name: "i", scope: !26, file: !14, line: 26, type: !27)
!26 = distinct !DILexicalBlock(scope: !20, file: !14, line: 25, column: 9)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !28, line: 46, baseType: !29)
!28 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/SVF-tools")
!29 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!30 = !DILocation(line: 26, column: 20, scope: !26)
!31 = !DILocation(line: 28, column: 20, scope: !32)
!32 = distinct !DILexicalBlock(scope: !26, file: !14, line: 28, column: 13)
!33 = !DILocation(line: 28, column: 18, scope: !32)
!34 = !DILocation(line: 28, column: 25, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !14, line: 28, column: 13)
!36 = !DILocation(line: 28, column: 27, scope: !35)
!37 = !DILocation(line: 28, column: 13, scope: !32)
!38 = !DILocation(line: 30, column: 34, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !14, line: 29, column: 13)
!40 = !DILocation(line: 30, column: 27, scope: !39)
!41 = !DILocation(line: 30, column: 17, scope: !39)
!42 = !DILocation(line: 30, column: 22, scope: !39)
!43 = !DILocation(line: 30, column: 25, scope: !39)
!44 = !DILocation(line: 31, column: 13, scope: !39)
!45 = !DILocation(line: 28, column: 35, scope: !35)
!46 = !DILocation(line: 28, column: 13, scope: !35)
!47 = distinct !{!47, !37, !48, !49}
!48 = !DILocation(line: 31, column: 13, scope: !32)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocation(line: 32, column: 26, scope: !26)
!51 = !DILocation(line: 32, column: 13, scope: !26)
!52 = !DILocation(line: 35, column: 1, scope: !13)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_bad", scope: !14, file: !14, line: 37, type: !54, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{null}
!56 = !DILocalVariable(name: "data", scope: !53, file: !14, line: 39, type: !4)
!57 = !DILocation(line: 39, column: 11, scope: !53)
!58 = !DILocalVariable(name: "dataBadBuffer", scope: !53, file: !14, line: 40, type: !4)
!59 = !DILocation(line: 40, column: 11, scope: !53)
!60 = !DILocation(line: 40, column: 34, scope: !53)
!61 = !DILocation(line: 40, column: 27, scope: !53)
!62 = !DILocalVariable(name: "dataGoodBuffer", scope: !53, file: !14, line: 41, type: !4)
!63 = !DILocation(line: 41, column: 11, scope: !53)
!64 = !DILocation(line: 41, column: 35, scope: !53)
!65 = !DILocation(line: 41, column: 28, scope: !53)
!66 = !DILocation(line: 44, column: 12, scope: !53)
!67 = !DILocation(line: 44, column: 10, scope: !53)
!68 = !DILocation(line: 45, column: 75, scope: !53)
!69 = !DILocation(line: 45, column: 5, scope: !53)
!70 = !DILocation(line: 46, column: 1, scope: !53)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_goodG2BSink", scope: !14, file: !14, line: 52, type: !15, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", arg: 1, scope: !71, file: !14, line: 52, type: !4)
!73 = !DILocation(line: 52, column: 86, scope: !71)
!74 = !DILocalVariable(name: "source", scope: !75, file: !14, line: 55, type: !21)
!75 = distinct !DILexicalBlock(scope: !71, file: !14, line: 54, column: 5)
!76 = !DILocation(line: 55, column: 13, scope: !75)
!77 = !DILocalVariable(name: "i", scope: !78, file: !14, line: 57, type: !27)
!78 = distinct !DILexicalBlock(scope: !75, file: !14, line: 56, column: 9)
!79 = !DILocation(line: 57, column: 20, scope: !78)
!80 = !DILocation(line: 59, column: 20, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !14, line: 59, column: 13)
!82 = !DILocation(line: 59, column: 18, scope: !81)
!83 = !DILocation(line: 59, column: 25, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !14, line: 59, column: 13)
!85 = !DILocation(line: 59, column: 27, scope: !84)
!86 = !DILocation(line: 59, column: 13, scope: !81)
!87 = !DILocation(line: 61, column: 34, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !14, line: 60, column: 13)
!89 = !DILocation(line: 61, column: 27, scope: !88)
!90 = !DILocation(line: 61, column: 17, scope: !88)
!91 = !DILocation(line: 61, column: 22, scope: !88)
!92 = !DILocation(line: 61, column: 25, scope: !88)
!93 = !DILocation(line: 62, column: 13, scope: !88)
!94 = !DILocation(line: 59, column: 35, scope: !84)
!95 = !DILocation(line: 59, column: 13, scope: !84)
!96 = distinct !{!96, !86, !97, !49}
!97 = !DILocation(line: 62, column: 13, scope: !81)
!98 = !DILocation(line: 63, column: 26, scope: !78)
!99 = !DILocation(line: 63, column: 13, scope: !78)
!100 = !DILocation(line: 66, column: 1, scope: !71)
!101 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_41_good", scope: !14, file: !14, line: 79, type: !54, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocation(line: 81, column: 5, scope: !101)
!103 = !DILocation(line: 82, column: 1, scope: !101)
!104 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 94, type: !105, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DISubroutineType(types: !106)
!106 = !{!5, !5, !107}
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!110 = !DILocalVariable(name: "argc", arg: 1, scope: !104, file: !14, line: 94, type: !5)
!111 = !DILocation(line: 94, column: 14, scope: !104)
!112 = !DILocalVariable(name: "argv", arg: 2, scope: !104, file: !14, line: 94, type: !107)
!113 = !DILocation(line: 94, column: 27, scope: !104)
!114 = !DILocation(line: 97, column: 22, scope: !104)
!115 = !DILocation(line: 97, column: 12, scope: !104)
!116 = !DILocation(line: 97, column: 5, scope: !104)
!117 = !DILocation(line: 99, column: 5, scope: !104)
!118 = !DILocation(line: 100, column: 5, scope: !104)
!119 = !DILocation(line: 101, column: 5, scope: !104)
!120 = !DILocation(line: 104, column: 5, scope: !104)
!121 = !DILocation(line: 105, column: 5, scope: !104)
!122 = !DILocation(line: 106, column: 5, scope: !104)
!123 = !DILocation(line: 108, column: 5, scope: !104)
!124 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 69, type: !54, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DILocalVariable(name: "data", scope: !124, file: !14, line: 71, type: !4)
!126 = !DILocation(line: 71, column: 11, scope: !124)
!127 = !DILocalVariable(name: "dataBadBuffer", scope: !124, file: !14, line: 72, type: !4)
!128 = !DILocation(line: 72, column: 11, scope: !124)
!129 = !DILocation(line: 72, column: 34, scope: !124)
!130 = !DILocation(line: 72, column: 27, scope: !124)
!131 = !DILocalVariable(name: "dataGoodBuffer", scope: !124, file: !14, line: 73, type: !4)
!132 = !DILocation(line: 73, column: 11, scope: !124)
!133 = !DILocation(line: 73, column: 35, scope: !124)
!134 = !DILocation(line: 73, column: 28, scope: !124)
!135 = !DILocation(line: 75, column: 12, scope: !124)
!136 = !DILocation(line: 75, column: 10, scope: !124)
!137 = !DILocation(line: 76, column: 79, scope: !124)
!138 = !DILocation(line: 76, column: 5, scope: !124)
!139 = !DILocation(line: 77, column: 1, scope: !124)
