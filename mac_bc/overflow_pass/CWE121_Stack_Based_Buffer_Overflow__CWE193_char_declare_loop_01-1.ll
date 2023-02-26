; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01_bad() #0 !dbg !11 {
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
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !30
  store i8* %arraydecay, i8** %data, align 8, !dbg !31
  %0 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !36
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !36
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !44, metadata !DIExpression()), !dbg !45
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !46
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !47
  store i64 %call, i64* %sourceLen, align 8, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !52
  %3 = load i64, i64* %sourceLen, align 8, !dbg !54
  %add = add i64 %3, 1, !dbg !55
  %cmp = icmp ult i64 %2, %add, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !60
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !60
  %6 = load i8*, i8** %data, align 8, !dbg !61
  %7 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !61
  store i8 %5, i8* %arrayidx3, align 1, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %8, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !70
  call void @printLine(i8* noundef %9), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @strlen(i8* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01_good() #0 !dbg !73 {
entry:
  call void @goodG2B(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* noundef null), !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 noundef %conv), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01_good(), !dbg !89
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01_bad(), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !95 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !102
  store i8* %arraydecay, i8** %data, align 8, !dbg !103
  %0 = load i8*, i8** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !108
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !108
  call void @llvm.dbg.declare(metadata i64* %i, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !113
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !114
  store i64 %call, i64* %sourceLen, align 8, !dbg !115
  store i64 0, i64* %i, align 8, !dbg !116
  br label %for.cond, !dbg !118

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !119
  %3 = load i64, i64* %sourceLen, align 8, !dbg !121
  %add = add i64 %3, 1, !dbg !122
  %cmp = icmp ult i64 %2, %add, !dbg !123
  br i1 %cmp, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !127
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !127
  %6 = load i8*, i8** %data, align 8, !dbg !128
  %7 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !128
  store i8 %5, i8* %arrayidx3, align 1, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !132
  %inc = add i64 %8, 1, !dbg !132
  store i64 %inc, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !136
  call void @printLine(i8* noundef %9), !dbg !137
  ret void, !dbg !138
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!30 = !DILocation(line: 35, column: 12, scope: !11)
!31 = !DILocation(line: 35, column: 10, scope: !11)
!32 = !DILocation(line: 36, column: 5, scope: !11)
!33 = !DILocation(line: 36, column: 13, scope: !11)
!34 = !DILocalVariable(name: "source", scope: !35, file: !12, line: 38, type: !26)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!36 = !DILocation(line: 38, column: 14, scope: !35)
!37 = !DILocalVariable(name: "i", scope: !35, file: !12, line: 39, type: !38)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 31, baseType: !40)
!39 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !41, line: 94, baseType: !42)
!41 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!42 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 39, column: 16, scope: !35)
!44 = !DILocalVariable(name: "sourceLen", scope: !35, file: !12, line: 39, type: !38)
!45 = !DILocation(line: 39, column: 19, scope: !35)
!46 = !DILocation(line: 40, column: 28, scope: !35)
!47 = !DILocation(line: 40, column: 21, scope: !35)
!48 = !DILocation(line: 40, column: 19, scope: !35)
!49 = !DILocation(line: 43, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !35, file: !12, line: 43, column: 9)
!51 = !DILocation(line: 43, column: 14, scope: !50)
!52 = !DILocation(line: 43, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 43, column: 9)
!54 = !DILocation(line: 43, column: 25, scope: !53)
!55 = !DILocation(line: 43, column: 35, scope: !53)
!56 = !DILocation(line: 43, column: 23, scope: !53)
!57 = !DILocation(line: 43, column: 9, scope: !50)
!58 = !DILocation(line: 45, column: 30, scope: !59)
!59 = distinct !DILexicalBlock(scope: !53, file: !12, line: 44, column: 9)
!60 = !DILocation(line: 45, column: 23, scope: !59)
!61 = !DILocation(line: 45, column: 13, scope: !59)
!62 = !DILocation(line: 45, column: 18, scope: !59)
!63 = !DILocation(line: 45, column: 21, scope: !59)
!64 = !DILocation(line: 46, column: 9, scope: !59)
!65 = !DILocation(line: 43, column: 41, scope: !53)
!66 = !DILocation(line: 43, column: 9, scope: !53)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 46, column: 9, scope: !50)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 47, column: 19, scope: !35)
!71 = !DILocation(line: 47, column: 9, scope: !35)
!72 = !DILocation(line: 49, column: 1, scope: !11)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01_good", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!74 = !DILocation(line: 81, column: 5, scope: !73)
!75 = !DILocation(line: 82, column: 1, scope: !73)
!76 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 94, type: !77, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !79, !80}
!79 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !12, line: 94, type: !79)
!82 = !DILocation(line: 94, column: 14, scope: !76)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !12, line: 94, type: !80)
!84 = !DILocation(line: 94, column: 27, scope: !76)
!85 = !DILocation(line: 97, column: 22, scope: !76)
!86 = !DILocation(line: 97, column: 12, scope: !76)
!87 = !DILocation(line: 97, column: 5, scope: !76)
!88 = !DILocation(line: 99, column: 5, scope: !76)
!89 = !DILocation(line: 100, column: 5, scope: !76)
!90 = !DILocation(line: 101, column: 5, scope: !76)
!91 = !DILocation(line: 104, column: 5, scope: !76)
!92 = !DILocation(line: 105, column: 5, scope: !76)
!93 = !DILocation(line: 106, column: 5, scope: !76)
!94 = !DILocation(line: 108, column: 5, scope: !76)
!95 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!96 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 58, type: !17)
!97 = !DILocation(line: 58, column: 12, scope: !95)
!98 = !DILocalVariable(name: "dataBadBuffer", scope: !95, file: !12, line: 59, type: !21)
!99 = !DILocation(line: 59, column: 10, scope: !95)
!100 = !DILocalVariable(name: "dataGoodBuffer", scope: !95, file: !12, line: 60, type: !26)
!101 = !DILocation(line: 60, column: 10, scope: !95)
!102 = !DILocation(line: 63, column: 12, scope: !95)
!103 = !DILocation(line: 63, column: 10, scope: !95)
!104 = !DILocation(line: 64, column: 5, scope: !95)
!105 = !DILocation(line: 64, column: 13, scope: !95)
!106 = !DILocalVariable(name: "source", scope: !107, file: !12, line: 66, type: !26)
!107 = distinct !DILexicalBlock(scope: !95, file: !12, line: 65, column: 5)
!108 = !DILocation(line: 66, column: 14, scope: !107)
!109 = !DILocalVariable(name: "i", scope: !107, file: !12, line: 67, type: !38)
!110 = !DILocation(line: 67, column: 16, scope: !107)
!111 = !DILocalVariable(name: "sourceLen", scope: !107, file: !12, line: 67, type: !38)
!112 = !DILocation(line: 67, column: 19, scope: !107)
!113 = !DILocation(line: 68, column: 28, scope: !107)
!114 = !DILocation(line: 68, column: 21, scope: !107)
!115 = !DILocation(line: 68, column: 19, scope: !107)
!116 = !DILocation(line: 71, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !107, file: !12, line: 71, column: 9)
!118 = !DILocation(line: 71, column: 14, scope: !117)
!119 = !DILocation(line: 71, column: 21, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !12, line: 71, column: 9)
!121 = !DILocation(line: 71, column: 25, scope: !120)
!122 = !DILocation(line: 71, column: 35, scope: !120)
!123 = !DILocation(line: 71, column: 23, scope: !120)
!124 = !DILocation(line: 71, column: 9, scope: !117)
!125 = !DILocation(line: 73, column: 30, scope: !126)
!126 = distinct !DILexicalBlock(scope: !120, file: !12, line: 72, column: 9)
!127 = !DILocation(line: 73, column: 23, scope: !126)
!128 = !DILocation(line: 73, column: 13, scope: !126)
!129 = !DILocation(line: 73, column: 18, scope: !126)
!130 = !DILocation(line: 73, column: 21, scope: !126)
!131 = !DILocation(line: 74, column: 9, scope: !126)
!132 = !DILocation(line: 71, column: 41, scope: !120)
!133 = !DILocation(line: 71, column: 9, scope: !120)
!134 = distinct !{!134, !124, !135, !69}
!135 = !DILocation(line: 74, column: 9, scope: !117)
!136 = !DILocation(line: 75, column: 19, scope: !107)
!137 = !DILocation(line: 75, column: 9, scope: !107)
!138 = !DILocation(line: 77, column: 1, scope: !95)
