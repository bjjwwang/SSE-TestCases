; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 10, align 16, !dbg !22
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %1 = alloca i8, i64 11, align 16, !dbg !25
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !24
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !26
  store i8* %2, i8** %data, align 8, !dbg !27
  %3 = load i8*, i8** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !30, metadata !DIExpression()), !dbg !32
  %4 = load i8*, i8** %data, align 8, !dbg !33
  store i8* %4, i8** %dataCopy, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !34, metadata !DIExpression()), !dbg !35
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !36
  store i8* %5, i8** %data1, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !50, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !52
  %call = call i64 @strlen(i8* noundef %arraydecay), !dbg !53
  store i64 %call, i64* %sourceLen, align 8, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !58
  %8 = load i64, i64* %sourceLen, align 8, !dbg !60
  %add = add i64 %8, 1, !dbg !61
  %cmp = icmp ult i64 %7, %add, !dbg !62
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %9, !dbg !66
  %10 = load i8, i8* %arrayidx2, align 1, !dbg !66
  %11 = load i8*, i8** %data1, align 8, !dbg !67
  %12 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx3 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !67
  store i8 %10, i8* %arrayidx3, align 1, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %13, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %14 = load i8*, i8** %data1, align 8, !dbg !76
  call void @printLine(i8* noundef %14), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @strlen(i8* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31_good() #0 !dbg !79 {
entry:
  call void @goodG2B(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !82 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31_good(), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31_bad(), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 10, align 16, !dbg !106
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %1 = alloca i8, i64 11, align 16, !dbg !109
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !108
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !110
  store i8* %2, i8** %data, align 8, !dbg !111
  %3 = load i8*, i8** %data, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !112
  store i8 0, i8* %arrayidx, align 1, !dbg !113
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !114, metadata !DIExpression()), !dbg !116
  %4 = load i8*, i8** %data, align 8, !dbg !117
  store i8* %4, i8** %dataCopy, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !118, metadata !DIExpression()), !dbg !119
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !120
  store i8* %5, i8** %data1, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !121, metadata !DIExpression()), !dbg !123
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !123
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !126, metadata !DIExpression()), !dbg !127
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !128
  %call = call i64 @strlen(i8* noundef %arraydecay), !dbg !129
  store i64 %call, i64* %sourceLen, align 8, !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !134
  %8 = load i64, i64* %sourceLen, align 8, !dbg !136
  %add = add i64 %8, 1, !dbg !137
  %cmp = icmp ult i64 %7, %add, !dbg !138
  br i1 %cmp, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %9, !dbg !142
  %10 = load i8, i8* %arrayidx2, align 1, !dbg !142
  %11 = load i8*, i8** %data1, align 8, !dbg !143
  %12 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx3 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !143
  store i8 %10, i8* %arrayidx3, align 1, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %13, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %14 = load i8*, i8** %data1, align 8, !dbg !151
  call void @printLine(i8* noundef %14), !dbg !152
  ret void, !dbg !153
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !3)
!19 = !DILocation(line: 30, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 31, type: !3)
!21 = !DILocation(line: 31, column: 12, scope: !13)
!22 = !DILocation(line: 31, column: 36, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 32, type: !3)
!24 = !DILocation(line: 32, column: 12, scope: !13)
!25 = !DILocation(line: 32, column: 37, scope: !13)
!26 = !DILocation(line: 35, column: 12, scope: !13)
!27 = !DILocation(line: 35, column: 10, scope: !13)
!28 = !DILocation(line: 36, column: 5, scope: !13)
!29 = !DILocation(line: 36, column: 13, scope: !13)
!30 = !DILocalVariable(name: "dataCopy", scope: !31, file: !14, line: 38, type: !3)
!31 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!32 = !DILocation(line: 38, column: 16, scope: !31)
!33 = !DILocation(line: 38, column: 27, scope: !31)
!34 = !DILocalVariable(name: "data", scope: !31, file: !14, line: 39, type: !3)
!35 = !DILocation(line: 39, column: 16, scope: !31)
!36 = !DILocation(line: 39, column: 23, scope: !31)
!37 = !DILocalVariable(name: "source", scope: !38, file: !14, line: 41, type: !39)
!38 = distinct !DILexicalBlock(scope: !31, file: !14, line: 40, column: 9)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 11)
!42 = !DILocation(line: 41, column: 18, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !38, file: !14, line: 42, type: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 31, baseType: !46)
!45 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !47, line: 94, baseType: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!48 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 42, column: 20, scope: !38)
!50 = !DILocalVariable(name: "sourceLen", scope: !38, file: !14, line: 42, type: !44)
!51 = !DILocation(line: 42, column: 23, scope: !38)
!52 = !DILocation(line: 43, column: 32, scope: !38)
!53 = !DILocation(line: 43, column: 25, scope: !38)
!54 = !DILocation(line: 43, column: 23, scope: !38)
!55 = !DILocation(line: 46, column: 20, scope: !56)
!56 = distinct !DILexicalBlock(scope: !38, file: !14, line: 46, column: 13)
!57 = !DILocation(line: 46, column: 18, scope: !56)
!58 = !DILocation(line: 46, column: 25, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !14, line: 46, column: 13)
!60 = !DILocation(line: 46, column: 29, scope: !59)
!61 = !DILocation(line: 46, column: 39, scope: !59)
!62 = !DILocation(line: 46, column: 27, scope: !59)
!63 = !DILocation(line: 46, column: 13, scope: !56)
!64 = !DILocation(line: 48, column: 34, scope: !65)
!65 = distinct !DILexicalBlock(scope: !59, file: !14, line: 47, column: 13)
!66 = !DILocation(line: 48, column: 27, scope: !65)
!67 = !DILocation(line: 48, column: 17, scope: !65)
!68 = !DILocation(line: 48, column: 22, scope: !65)
!69 = !DILocation(line: 48, column: 25, scope: !65)
!70 = !DILocation(line: 49, column: 13, scope: !65)
!71 = !DILocation(line: 46, column: 45, scope: !59)
!72 = !DILocation(line: 46, column: 13, scope: !59)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 49, column: 13, scope: !56)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 50, column: 23, scope: !38)
!77 = !DILocation(line: 50, column: 13, scope: !38)
!78 = !DILocation(line: 53, column: 1, scope: !13)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31_good", scope: !14, file: !14, line: 87, type: !15, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!80 = !DILocation(line: 89, column: 5, scope: !79)
!81 = !DILocation(line: 90, column: 1, scope: !79)
!82 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 101, type: !83, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!83 = !DISubroutineType(types: !84)
!84 = !{!85, !85, !86}
!85 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !14, line: 101, type: !85)
!88 = !DILocation(line: 101, column: 14, scope: !82)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !14, line: 101, type: !86)
!90 = !DILocation(line: 101, column: 27, scope: !82)
!91 = !DILocation(line: 104, column: 22, scope: !82)
!92 = !DILocation(line: 104, column: 12, scope: !82)
!93 = !DILocation(line: 104, column: 5, scope: !82)
!94 = !DILocation(line: 106, column: 5, scope: !82)
!95 = !DILocation(line: 107, column: 5, scope: !82)
!96 = !DILocation(line: 108, column: 5, scope: !82)
!97 = !DILocation(line: 111, column: 5, scope: !82)
!98 = !DILocation(line: 112, column: 5, scope: !82)
!99 = !DILocation(line: 113, column: 5, scope: !82)
!100 = !DILocation(line: 115, column: 5, scope: !82)
!101 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!102 = !DILocalVariable(name: "data", scope: !101, file: !14, line: 62, type: !3)
!103 = !DILocation(line: 62, column: 12, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !14, line: 63, type: !3)
!105 = !DILocation(line: 63, column: 12, scope: !101)
!106 = !DILocation(line: 63, column: 36, scope: !101)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !14, line: 64, type: !3)
!108 = !DILocation(line: 64, column: 12, scope: !101)
!109 = !DILocation(line: 64, column: 37, scope: !101)
!110 = !DILocation(line: 67, column: 12, scope: !101)
!111 = !DILocation(line: 67, column: 10, scope: !101)
!112 = !DILocation(line: 68, column: 5, scope: !101)
!113 = !DILocation(line: 68, column: 13, scope: !101)
!114 = !DILocalVariable(name: "dataCopy", scope: !115, file: !14, line: 70, type: !3)
!115 = distinct !DILexicalBlock(scope: !101, file: !14, line: 69, column: 5)
!116 = !DILocation(line: 70, column: 16, scope: !115)
!117 = !DILocation(line: 70, column: 27, scope: !115)
!118 = !DILocalVariable(name: "data", scope: !115, file: !14, line: 71, type: !3)
!119 = !DILocation(line: 71, column: 16, scope: !115)
!120 = !DILocation(line: 71, column: 23, scope: !115)
!121 = !DILocalVariable(name: "source", scope: !122, file: !14, line: 73, type: !39)
!122 = distinct !DILexicalBlock(scope: !115, file: !14, line: 72, column: 9)
!123 = !DILocation(line: 73, column: 18, scope: !122)
!124 = !DILocalVariable(name: "i", scope: !122, file: !14, line: 74, type: !44)
!125 = !DILocation(line: 74, column: 20, scope: !122)
!126 = !DILocalVariable(name: "sourceLen", scope: !122, file: !14, line: 74, type: !44)
!127 = !DILocation(line: 74, column: 23, scope: !122)
!128 = !DILocation(line: 75, column: 32, scope: !122)
!129 = !DILocation(line: 75, column: 25, scope: !122)
!130 = !DILocation(line: 75, column: 23, scope: !122)
!131 = !DILocation(line: 78, column: 20, scope: !132)
!132 = distinct !DILexicalBlock(scope: !122, file: !14, line: 78, column: 13)
!133 = !DILocation(line: 78, column: 18, scope: !132)
!134 = !DILocation(line: 78, column: 25, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !14, line: 78, column: 13)
!136 = !DILocation(line: 78, column: 29, scope: !135)
!137 = !DILocation(line: 78, column: 39, scope: !135)
!138 = !DILocation(line: 78, column: 27, scope: !135)
!139 = !DILocation(line: 78, column: 13, scope: !132)
!140 = !DILocation(line: 80, column: 34, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !14, line: 79, column: 13)
!142 = !DILocation(line: 80, column: 27, scope: !141)
!143 = !DILocation(line: 80, column: 17, scope: !141)
!144 = !DILocation(line: 80, column: 22, scope: !141)
!145 = !DILocation(line: 80, column: 25, scope: !141)
!146 = !DILocation(line: 81, column: 13, scope: !141)
!147 = !DILocation(line: 78, column: 45, scope: !135)
!148 = !DILocation(line: 78, column: 13, scope: !135)
!149 = distinct !{!149, !139, !150, !75}
!150 = !DILocation(line: 81, column: 13, scope: !132)
!151 = !DILocation(line: 82, column: 23, scope: !122)
!152 = !DILocation(line: 82, column: 13, scope: !122)
!153 = !DILocation(line: 85, column: 1, scope: !101)
