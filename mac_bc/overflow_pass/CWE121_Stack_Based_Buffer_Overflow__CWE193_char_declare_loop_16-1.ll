; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  br label %while.body, !dbg !30

while.body:                                       ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  store i8* %arraydecay, i8** %data, align 8, !dbg !33
  %0 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  br label %while.end, !dbg !36

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !37, metadata !DIExpression()), !dbg !39
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !47, metadata !DIExpression()), !dbg !48
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !49
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !50
  store i64 %call, i64* %sourceLen, align 8, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %while.end
  %2 = load i64, i64* %i, align 8, !dbg !55
  %3 = load i64, i64* %sourceLen, align 8, !dbg !57
  %add = add i64 %3, 1, !dbg !58
  %cmp = icmp ult i64 %2, %add, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !63
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !63
  %6 = load i8*, i8** %data, align 8, !dbg !64
  %7 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !64
  store i8 %5, i8* %arrayidx3, align 1, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %8, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !73
  call void @printLine(i8* noundef %9), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @strlen(i8* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16_good() #0 !dbg !76 {
entry:
  call void @goodG2B(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* noundef null), !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 noundef %conv), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16_good(), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16_bad(), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  br label %while.body, !dbg !105

while.body:                                       ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !106
  store i8* %arraydecay, i8** %data, align 8, !dbg !108
  %0 = load i8*, i8** %data, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !110
  br label %while.end, !dbg !111

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !112, metadata !DIExpression()), !dbg !114
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !114
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !114
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !117, metadata !DIExpression()), !dbg !118
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !119
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !120
  store i64 %call, i64* %sourceLen, align 8, !dbg !121
  store i64 0, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %while.end
  %2 = load i64, i64* %i, align 8, !dbg !125
  %3 = load i64, i64* %sourceLen, align 8, !dbg !127
  %add = add i64 %3, 1, !dbg !128
  %cmp = icmp ult i64 %2, %add, !dbg !129
  br i1 %cmp, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !133
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !133
  %6 = load i8*, i8** %data, align 8, !dbg !134
  %7 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !134
  store i8 %5, i8* %arrayidx3, align 1, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %8, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !142
  call void @printLine(i8* noundef %9), !dbg !143
  ret void, !dbg !144
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 30, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 80, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 10)
!24 = !DILocation(line: 31, column: 10, scope: !11)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 88, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 11)
!29 = !DILocation(line: 32, column: 10, scope: !11)
!30 = !DILocation(line: 33, column: 5, scope: !11)
!31 = !DILocation(line: 37, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!33 = !DILocation(line: 37, column: 14, scope: !32)
!34 = !DILocation(line: 38, column: 9, scope: !32)
!35 = !DILocation(line: 38, column: 17, scope: !32)
!36 = !DILocation(line: 39, column: 9, scope: !32)
!37 = !DILocalVariable(name: "source", scope: !38, file: !12, line: 42, type: !26)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!39 = !DILocation(line: 42, column: 14, scope: !38)
!40 = !DILocalVariable(name: "i", scope: !38, file: !12, line: 43, type: !41)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 31, baseType: !43)
!42 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !44, line: 94, baseType: !45)
!44 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!45 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 43, column: 16, scope: !38)
!47 = !DILocalVariable(name: "sourceLen", scope: !38, file: !12, line: 43, type: !41)
!48 = !DILocation(line: 43, column: 19, scope: !38)
!49 = !DILocation(line: 44, column: 28, scope: !38)
!50 = !DILocation(line: 44, column: 21, scope: !38)
!51 = !DILocation(line: 44, column: 19, scope: !38)
!52 = !DILocation(line: 47, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !38, file: !12, line: 47, column: 9)
!54 = !DILocation(line: 47, column: 14, scope: !53)
!55 = !DILocation(line: 47, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !12, line: 47, column: 9)
!57 = !DILocation(line: 47, column: 25, scope: !56)
!58 = !DILocation(line: 47, column: 35, scope: !56)
!59 = !DILocation(line: 47, column: 23, scope: !56)
!60 = !DILocation(line: 47, column: 9, scope: !53)
!61 = !DILocation(line: 49, column: 30, scope: !62)
!62 = distinct !DILexicalBlock(scope: !56, file: !12, line: 48, column: 9)
!63 = !DILocation(line: 49, column: 23, scope: !62)
!64 = !DILocation(line: 49, column: 13, scope: !62)
!65 = !DILocation(line: 49, column: 18, scope: !62)
!66 = !DILocation(line: 49, column: 21, scope: !62)
!67 = !DILocation(line: 50, column: 9, scope: !62)
!68 = !DILocation(line: 47, column: 41, scope: !56)
!69 = !DILocation(line: 47, column: 9, scope: !56)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 50, column: 9, scope: !53)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 51, column: 19, scope: !38)
!74 = !DILocation(line: 51, column: 9, scope: !38)
!75 = !DILocation(line: 53, column: 1, scope: !11)
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!77 = !DILocation(line: 89, column: 5, scope: !76)
!78 = !DILocation(line: 90, column: 1, scope: !76)
!79 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 102, type: !80, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!80 = !DISubroutineType(types: !81)
!81 = !{!82, !82, !83}
!82 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !12, line: 102, type: !82)
!85 = !DILocation(line: 102, column: 14, scope: !79)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !12, line: 102, type: !83)
!87 = !DILocation(line: 102, column: 27, scope: !79)
!88 = !DILocation(line: 105, column: 22, scope: !79)
!89 = !DILocation(line: 105, column: 12, scope: !79)
!90 = !DILocation(line: 105, column: 5, scope: !79)
!91 = !DILocation(line: 107, column: 5, scope: !79)
!92 = !DILocation(line: 108, column: 5, scope: !79)
!93 = !DILocation(line: 109, column: 5, scope: !79)
!94 = !DILocation(line: 112, column: 5, scope: !79)
!95 = !DILocation(line: 113, column: 5, scope: !79)
!96 = !DILocation(line: 114, column: 5, scope: !79)
!97 = !DILocation(line: 116, column: 5, scope: !79)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!99 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 62, type: !17)
!100 = !DILocation(line: 62, column: 12, scope: !98)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !12, line: 63, type: !21)
!102 = !DILocation(line: 63, column: 10, scope: !98)
!103 = !DILocalVariable(name: "dataGoodBuffer", scope: !98, file: !12, line: 64, type: !26)
!104 = !DILocation(line: 64, column: 10, scope: !98)
!105 = !DILocation(line: 65, column: 5, scope: !98)
!106 = !DILocation(line: 69, column: 16, scope: !107)
!107 = distinct !DILexicalBlock(scope: !98, file: !12, line: 66, column: 5)
!108 = !DILocation(line: 69, column: 14, scope: !107)
!109 = !DILocation(line: 70, column: 9, scope: !107)
!110 = !DILocation(line: 70, column: 17, scope: !107)
!111 = !DILocation(line: 71, column: 9, scope: !107)
!112 = !DILocalVariable(name: "source", scope: !113, file: !12, line: 74, type: !26)
!113 = distinct !DILexicalBlock(scope: !98, file: !12, line: 73, column: 5)
!114 = !DILocation(line: 74, column: 14, scope: !113)
!115 = !DILocalVariable(name: "i", scope: !113, file: !12, line: 75, type: !41)
!116 = !DILocation(line: 75, column: 16, scope: !113)
!117 = !DILocalVariable(name: "sourceLen", scope: !113, file: !12, line: 75, type: !41)
!118 = !DILocation(line: 75, column: 19, scope: !113)
!119 = !DILocation(line: 76, column: 28, scope: !113)
!120 = !DILocation(line: 76, column: 21, scope: !113)
!121 = !DILocation(line: 76, column: 19, scope: !113)
!122 = !DILocation(line: 79, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !113, file: !12, line: 79, column: 9)
!124 = !DILocation(line: 79, column: 14, scope: !123)
!125 = !DILocation(line: 79, column: 21, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !12, line: 79, column: 9)
!127 = !DILocation(line: 79, column: 25, scope: !126)
!128 = !DILocation(line: 79, column: 35, scope: !126)
!129 = !DILocation(line: 79, column: 23, scope: !126)
!130 = !DILocation(line: 79, column: 9, scope: !123)
!131 = !DILocation(line: 81, column: 30, scope: !132)
!132 = distinct !DILexicalBlock(scope: !126, file: !12, line: 80, column: 9)
!133 = !DILocation(line: 81, column: 23, scope: !132)
!134 = !DILocation(line: 81, column: 13, scope: !132)
!135 = !DILocation(line: 81, column: 18, scope: !132)
!136 = !DILocation(line: 81, column: 21, scope: !132)
!137 = !DILocation(line: 82, column: 9, scope: !132)
!138 = !DILocation(line: 79, column: 41, scope: !126)
!139 = !DILocation(line: 79, column: 9, scope: !126)
!140 = distinct !{!140, !130, !141, !72}
!141 = !DILocation(line: 82, column: 9, scope: !123)
!142 = !DILocation(line: 83, column: 19, scope: !113)
!143 = !DILocation(line: 83, column: 9, scope: !113)
!144 = !DILocation(line: 85, column: 1, scope: !98)
