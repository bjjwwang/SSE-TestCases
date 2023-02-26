; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_04-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_04_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 200, align 16, !dbg !22
  %1 = bitcast i8* %0 to i32*, !dbg !23
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %2 = alloca i8, i64 400, align 16, !dbg !26
  %3 = bitcast i8* %2 to i32*, !dbg !27
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !25
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !28
  store i32* %4, i32** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !49
  %cmp = icmp ult i64 %6, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !55
  %8 = load i32, i32* %arrayidx, align 4, !dbg !55
  %9 = load i32*, i32** %data, align 8, !dbg !56
  %10 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx1 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !56
  store i32 %8, i32* %arrayidx1, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %11, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !65
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 0, !dbg !65
  %13 = load i32, i32* %arrayidx2, align 4, !dbg !65
  call void @printIntLine(i32 noundef %13), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printIntLine(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_04_good() #0 !dbg !68 {
entry:
  call void @goodG2B1(), !dbg !69
  call void @goodG2B2(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* noundef null), !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 noundef %conv), !dbg !84
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_04_good(), !dbg !86
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_04_bad(), !dbg !89
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = alloca i8, i64 200, align 16, !dbg !97
  %1 = bitcast i8* %0 to i32*, !dbg !98
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %2 = alloca i8, i64 400, align 16, !dbg !101
  %3 = bitcast i8* %2 to i32*, !dbg !102
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !100
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !103
  store i32* %4, i32** %data, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !109
  call void @llvm.dbg.declare(metadata i64* %i, metadata !110, metadata !DIExpression()), !dbg !112
  store i64 0, i64* %i, align 8, !dbg !113
  br label %for.cond, !dbg !115

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !116
  %cmp = icmp ult i64 %6, 100, !dbg !118
  br i1 %cmp, label %for.body, label %for.end, !dbg !119

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !120
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !122
  %8 = load i32, i32* %arrayidx, align 4, !dbg !122
  %9 = load i32*, i32** %data, align 8, !dbg !123
  %10 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx1 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !123
  store i32 %8, i32* %arrayidx1, align 4, !dbg !125
  br label %for.inc, !dbg !126

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !127
  %inc = add i64 %11, 1, !dbg !127
  store i64 %inc, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !128, !llvm.loop !129

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !131
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 0, !dbg !131
  %13 = load i32, i32* %arrayidx2, align 4, !dbg !131
  call void @printIntLine(i32 noundef %13), !dbg !132
  ret void, !dbg !133
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !134 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !137, metadata !DIExpression()), !dbg !138
  %0 = alloca i8, i64 200, align 16, !dbg !139
  %1 = bitcast i8* %0 to i32*, !dbg !140
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !141, metadata !DIExpression()), !dbg !142
  %2 = alloca i8, i64 400, align 16, !dbg !143
  %3 = bitcast i8* %2 to i32*, !dbg !144
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !142
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !145
  store i32* %4, i32** %data, align 8, !dbg !148
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !149, metadata !DIExpression()), !dbg !151
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !151
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !151
  call void @llvm.dbg.declare(metadata i64* %i, metadata !152, metadata !DIExpression()), !dbg !154
  store i64 0, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !157

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !158
  %cmp = icmp ult i64 %6, 100, !dbg !160
  br i1 %cmp, label %for.body, label %for.end, !dbg !161

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !164
  %8 = load i32, i32* %arrayidx, align 4, !dbg !164
  %9 = load i32*, i32** %data, align 8, !dbg !165
  %10 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx1 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !165
  store i32 %8, i32* %arrayidx1, align 4, !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !169
  %inc = add i64 %11, 1, !dbg !169
  store i64 %inc, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !173
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 0, !dbg !173
  %13 = load i32, i32* %arrayidx2, align 4, !dbg !173
  call void @printIntLine(i32 noundef %13), !dbg !174
  ret void, !dbg !175
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_04_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !3)
!19 = !DILocation(line: 30, column: 11, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 31, type: !3)
!21 = !DILocation(line: 31, column: 11, scope: !13)
!22 = !DILocation(line: 31, column: 34, scope: !13)
!23 = !DILocation(line: 31, column: 27, scope: !13)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 32, type: !3)
!25 = !DILocation(line: 32, column: 11, scope: !13)
!26 = !DILocation(line: 32, column: 35, scope: !13)
!27 = !DILocation(line: 32, column: 28, scope: !13)
!28 = !DILocation(line: 37, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !30, file: !14, line: 34, column: 5)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 33, column: 8)
!31 = !DILocation(line: 37, column: 14, scope: !29)
!32 = !DILocalVariable(name: "source", scope: !33, file: !14, line: 40, type: !34)
!33 = distinct !DILexicalBlock(scope: !13, file: !14, line: 39, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 40, column: 13, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !39, file: !14, line: 42, type: !40)
!39 = distinct !DILexicalBlock(scope: !33, file: !14, line: 41, column: 9)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 31, baseType: !42)
!41 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !43, line: 94, baseType: !44)
!43 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!44 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 42, column: 20, scope: !39)
!46 = !DILocation(line: 44, column: 20, scope: !47)
!47 = distinct !DILexicalBlock(scope: !39, file: !14, line: 44, column: 13)
!48 = !DILocation(line: 44, column: 18, scope: !47)
!49 = !DILocation(line: 44, column: 25, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !14, line: 44, column: 13)
!51 = !DILocation(line: 44, column: 27, scope: !50)
!52 = !DILocation(line: 44, column: 13, scope: !47)
!53 = !DILocation(line: 46, column: 34, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !14, line: 45, column: 13)
!55 = !DILocation(line: 46, column: 27, scope: !54)
!56 = !DILocation(line: 46, column: 17, scope: !54)
!57 = !DILocation(line: 46, column: 22, scope: !54)
!58 = !DILocation(line: 46, column: 25, scope: !54)
!59 = !DILocation(line: 47, column: 13, scope: !54)
!60 = !DILocation(line: 44, column: 35, scope: !50)
!61 = !DILocation(line: 44, column: 13, scope: !50)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 47, column: 13, scope: !47)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 48, column: 26, scope: !39)
!66 = !DILocation(line: 48, column: 13, scope: !39)
!67 = !DILocation(line: 51, column: 1, scope: !13)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_04_good", scope: !14, file: !14, line: 112, type: !15, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!69 = !DILocation(line: 114, column: 5, scope: !68)
!70 = !DILocation(line: 115, column: 5, scope: !68)
!71 = !DILocation(line: 116, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 128, type: !73, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!73 = !DISubroutineType(types: !74)
!74 = !{!4, !4, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !14, line: 128, type: !4)
!79 = !DILocation(line: 128, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !14, line: 128, type: !75)
!81 = !DILocation(line: 128, column: 27, scope: !72)
!82 = !DILocation(line: 131, column: 22, scope: !72)
!83 = !DILocation(line: 131, column: 12, scope: !72)
!84 = !DILocation(line: 131, column: 5, scope: !72)
!85 = !DILocation(line: 133, column: 5, scope: !72)
!86 = !DILocation(line: 134, column: 5, scope: !72)
!87 = !DILocation(line: 135, column: 5, scope: !72)
!88 = !DILocation(line: 138, column: 5, scope: !72)
!89 = !DILocation(line: 139, column: 5, scope: !72)
!90 = !DILocation(line: 140, column: 5, scope: !72)
!91 = !DILocation(line: 142, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 58, type: !15, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!93 = !DILocalVariable(name: "data", scope: !92, file: !14, line: 60, type: !3)
!94 = !DILocation(line: 60, column: 11, scope: !92)
!95 = !DILocalVariable(name: "dataBadBuffer", scope: !92, file: !14, line: 61, type: !3)
!96 = !DILocation(line: 61, column: 11, scope: !92)
!97 = !DILocation(line: 61, column: 34, scope: !92)
!98 = !DILocation(line: 61, column: 27, scope: !92)
!99 = !DILocalVariable(name: "dataGoodBuffer", scope: !92, file: !14, line: 62, type: !3)
!100 = !DILocation(line: 62, column: 11, scope: !92)
!101 = !DILocation(line: 62, column: 35, scope: !92)
!102 = !DILocation(line: 62, column: 28, scope: !92)
!103 = !DILocation(line: 71, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !105, file: !14, line: 69, column: 5)
!105 = distinct !DILexicalBlock(scope: !92, file: !14, line: 63, column: 8)
!106 = !DILocation(line: 71, column: 14, scope: !104)
!107 = !DILocalVariable(name: "source", scope: !108, file: !14, line: 74, type: !34)
!108 = distinct !DILexicalBlock(scope: !92, file: !14, line: 73, column: 5)
!109 = !DILocation(line: 74, column: 13, scope: !108)
!110 = !DILocalVariable(name: "i", scope: !111, file: !14, line: 76, type: !40)
!111 = distinct !DILexicalBlock(scope: !108, file: !14, line: 75, column: 9)
!112 = !DILocation(line: 76, column: 20, scope: !111)
!113 = !DILocation(line: 78, column: 20, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !14, line: 78, column: 13)
!115 = !DILocation(line: 78, column: 18, scope: !114)
!116 = !DILocation(line: 78, column: 25, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !14, line: 78, column: 13)
!118 = !DILocation(line: 78, column: 27, scope: !117)
!119 = !DILocation(line: 78, column: 13, scope: !114)
!120 = !DILocation(line: 80, column: 34, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !14, line: 79, column: 13)
!122 = !DILocation(line: 80, column: 27, scope: !121)
!123 = !DILocation(line: 80, column: 17, scope: !121)
!124 = !DILocation(line: 80, column: 22, scope: !121)
!125 = !DILocation(line: 80, column: 25, scope: !121)
!126 = !DILocation(line: 81, column: 13, scope: !121)
!127 = !DILocation(line: 78, column: 35, scope: !117)
!128 = !DILocation(line: 78, column: 13, scope: !117)
!129 = distinct !{!129, !119, !130, !64}
!130 = !DILocation(line: 81, column: 13, scope: !114)
!131 = !DILocation(line: 82, column: 26, scope: !111)
!132 = !DILocation(line: 82, column: 13, scope: !111)
!133 = !DILocation(line: 85, column: 1, scope: !92)
!134 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 88, type: !15, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!135 = !DILocalVariable(name: "data", scope: !134, file: !14, line: 90, type: !3)
!136 = !DILocation(line: 90, column: 11, scope: !134)
!137 = !DILocalVariable(name: "dataBadBuffer", scope: !134, file: !14, line: 91, type: !3)
!138 = !DILocation(line: 91, column: 11, scope: !134)
!139 = !DILocation(line: 91, column: 34, scope: !134)
!140 = !DILocation(line: 91, column: 27, scope: !134)
!141 = !DILocalVariable(name: "dataGoodBuffer", scope: !134, file: !14, line: 92, type: !3)
!142 = !DILocation(line: 92, column: 11, scope: !134)
!143 = !DILocation(line: 92, column: 35, scope: !134)
!144 = !DILocation(line: 92, column: 28, scope: !134)
!145 = !DILocation(line: 96, column: 16, scope: !146)
!146 = distinct !DILexicalBlock(scope: !147, file: !14, line: 94, column: 5)
!147 = distinct !DILexicalBlock(scope: !134, file: !14, line: 93, column: 8)
!148 = !DILocation(line: 96, column: 14, scope: !146)
!149 = !DILocalVariable(name: "source", scope: !150, file: !14, line: 99, type: !34)
!150 = distinct !DILexicalBlock(scope: !134, file: !14, line: 98, column: 5)
!151 = !DILocation(line: 99, column: 13, scope: !150)
!152 = !DILocalVariable(name: "i", scope: !153, file: !14, line: 101, type: !40)
!153 = distinct !DILexicalBlock(scope: !150, file: !14, line: 100, column: 9)
!154 = !DILocation(line: 101, column: 20, scope: !153)
!155 = !DILocation(line: 103, column: 20, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !14, line: 103, column: 13)
!157 = !DILocation(line: 103, column: 18, scope: !156)
!158 = !DILocation(line: 103, column: 25, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !14, line: 103, column: 13)
!160 = !DILocation(line: 103, column: 27, scope: !159)
!161 = !DILocation(line: 103, column: 13, scope: !156)
!162 = !DILocation(line: 105, column: 34, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !14, line: 104, column: 13)
!164 = !DILocation(line: 105, column: 27, scope: !163)
!165 = !DILocation(line: 105, column: 17, scope: !163)
!166 = !DILocation(line: 105, column: 22, scope: !163)
!167 = !DILocation(line: 105, column: 25, scope: !163)
!168 = !DILocation(line: 106, column: 13, scope: !163)
!169 = !DILocation(line: 103, column: 35, scope: !159)
!170 = !DILocation(line: 103, column: 13, scope: !159)
!171 = distinct !{!171, !161, !172, !64}
!172 = !DILocation(line: 106, column: 13, scope: !156)
!173 = !DILocation(line: 107, column: 26, scope: !153)
!174 = !DILocation(line: 107, column: 13, scope: !153)
!175 = !DILocation(line: 110, column: 1, scope: !134)
