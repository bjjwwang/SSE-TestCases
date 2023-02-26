; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17_bad() #0 !dbg !13 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 10, align 16, !dbg !25
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %1 = alloca i8, i64 11, align 16, !dbg !28
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !27
  store i32 0, i32* %i, align 4, !dbg !29
  br label %for.cond, !dbg !31

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !dbg !32
  %cmp = icmp slt i32 %2, 1, !dbg !34
  br i1 %cmp, label %for.body, label %for.end, !dbg !35

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !36
  store i8* %3, i8** %data, align 8, !dbg !38
  %4 = load i8*, i8** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  br label %for.inc, !dbg !41

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !42
  %inc = add nsw i32 %5, 1, !dbg !42
  store i32 %inc, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !52
  %7 = load i8*, i8** %data, align 8, !dbg !53
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !53
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !53
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !53
  %add = add i64 %call, 1, !dbg !53
  %mul = mul i64 %add, 1, !dbg !53
  %8 = load i8*, i8** %data, align 8, !dbg !53
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !53
  %call2 = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %arraydecay, i64 noundef %mul, i64 noundef %9) #5, !dbg !53
  %10 = load i8*, i8** %data, align 8, !dbg !54
  call void @printLine(i8* noundef %10), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* noundef null), !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 noundef %conv), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17_good(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17_bad(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %h, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = alloca i8, i64 10, align 16, !dbg !85
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %1 = alloca i8, i64 11, align 16, !dbg !88
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !87
  store i32 0, i32* %h, align 4, !dbg !89
  br label %for.cond, !dbg !91

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %h, align 4, !dbg !92
  %cmp = icmp slt i32 %2, 1, !dbg !94
  br i1 %cmp, label %for.body, label %for.end, !dbg !95

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !96
  store i8* %3, i8** %data, align 8, !dbg !98
  %4 = load i8*, i8** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !99
  store i8 0, i8* %arrayidx, align 1, !dbg !100
  br label %for.inc, !dbg !101

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %h, align 4, !dbg !102
  %inc = add nsw i32 %5, 1, !dbg !102
  store i32 %inc, i32* %h, align 4, !dbg !102
  br label %for.cond, !dbg !103, !llvm.loop !104

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !108
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !108
  %7 = load i8*, i8** %data, align 8, !dbg !109
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !109
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !109
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !109
  %add = add i64 %call, 1, !dbg !109
  %mul = mul i64 %add, 1, !dbg !109
  %8 = load i8*, i8** %data, align 8, !dbg !109
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !109
  %call2 = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %arraydecay, i64 noundef %mul, i64 noundef %9) #5, !dbg !109
  %10 = load i8*, i8** %data, align 8, !dbg !110
  call void @printLine(i8* noundef %10), !dbg !111
  ret void, !dbg !112
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "i", scope: !13, file: !14, line: 30, type: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 30, column: 9, scope: !13)
!21 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 31, type: !3)
!22 = !DILocation(line: 31, column: 12, scope: !13)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 32, type: !3)
!24 = !DILocation(line: 32, column: 12, scope: !13)
!25 = !DILocation(line: 32, column: 36, scope: !13)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 33, type: !3)
!27 = !DILocation(line: 33, column: 12, scope: !13)
!28 = !DILocation(line: 33, column: 37, scope: !13)
!29 = !DILocation(line: 34, column: 11, scope: !30)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!31 = !DILocation(line: 34, column: 9, scope: !30)
!32 = !DILocation(line: 34, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !14, line: 34, column: 5)
!34 = !DILocation(line: 34, column: 18, scope: !33)
!35 = !DILocation(line: 34, column: 5, scope: !30)
!36 = !DILocation(line: 38, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !14, line: 35, column: 5)
!38 = !DILocation(line: 38, column: 14, scope: !37)
!39 = !DILocation(line: 39, column: 9, scope: !37)
!40 = !DILocation(line: 39, column: 17, scope: !37)
!41 = !DILocation(line: 40, column: 5, scope: !37)
!42 = !DILocation(line: 34, column: 24, scope: !33)
!43 = !DILocation(line: 34, column: 5, scope: !33)
!44 = distinct !{!44, !35, !45, !46}
!45 = !DILocation(line: 40, column: 5, scope: !30)
!46 = !{!"llvm.loop.mustprogress"}
!47 = !DILocalVariable(name: "source", scope: !48, file: !14, line: 42, type: !49)
!48 = distinct !DILexicalBlock(scope: !13, file: !14, line: 41, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 11)
!52 = !DILocation(line: 42, column: 14, scope: !48)
!53 = !DILocation(line: 45, column: 9, scope: !48)
!54 = !DILocation(line: 46, column: 19, scope: !48)
!55 = !DILocation(line: 46, column: 9, scope: !48)
!56 = !DILocation(line: 48, column: 1, scope: !13)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17_good", scope: !14, file: !14, line: 77, type: !15, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!58 = !DILocation(line: 79, column: 5, scope: !57)
!59 = !DILocation(line: 80, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 92, type: !61, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!61 = !DISubroutineType(types: !62)
!62 = !{!19, !19, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !14, line: 92, type: !19)
!65 = !DILocation(line: 92, column: 14, scope: !60)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !14, line: 92, type: !63)
!67 = !DILocation(line: 92, column: 27, scope: !60)
!68 = !DILocation(line: 95, column: 22, scope: !60)
!69 = !DILocation(line: 95, column: 12, scope: !60)
!70 = !DILocation(line: 95, column: 5, scope: !60)
!71 = !DILocation(line: 97, column: 5, scope: !60)
!72 = !DILocation(line: 98, column: 5, scope: !60)
!73 = !DILocation(line: 99, column: 5, scope: !60)
!74 = !DILocation(line: 102, column: 5, scope: !60)
!75 = !DILocation(line: 103, column: 5, scope: !60)
!76 = !DILocation(line: 104, column: 5, scope: !60)
!77 = !DILocation(line: 106, column: 5, scope: !60)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!79 = !DILocalVariable(name: "h", scope: !78, file: !14, line: 57, type: !19)
!80 = !DILocation(line: 57, column: 9, scope: !78)
!81 = !DILocalVariable(name: "data", scope: !78, file: !14, line: 58, type: !3)
!82 = !DILocation(line: 58, column: 12, scope: !78)
!83 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !14, line: 59, type: !3)
!84 = !DILocation(line: 59, column: 12, scope: !78)
!85 = !DILocation(line: 59, column: 36, scope: !78)
!86 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !14, line: 60, type: !3)
!87 = !DILocation(line: 60, column: 12, scope: !78)
!88 = !DILocation(line: 60, column: 37, scope: !78)
!89 = !DILocation(line: 61, column: 11, scope: !90)
!90 = distinct !DILexicalBlock(scope: !78, file: !14, line: 61, column: 5)
!91 = !DILocation(line: 61, column: 9, scope: !90)
!92 = !DILocation(line: 61, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !14, line: 61, column: 5)
!94 = !DILocation(line: 61, column: 18, scope: !93)
!95 = !DILocation(line: 61, column: 5, scope: !90)
!96 = !DILocation(line: 65, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !14, line: 62, column: 5)
!98 = !DILocation(line: 65, column: 14, scope: !97)
!99 = !DILocation(line: 66, column: 9, scope: !97)
!100 = !DILocation(line: 66, column: 17, scope: !97)
!101 = !DILocation(line: 67, column: 5, scope: !97)
!102 = !DILocation(line: 61, column: 24, scope: !93)
!103 = !DILocation(line: 61, column: 5, scope: !93)
!104 = distinct !{!104, !95, !105, !46}
!105 = !DILocation(line: 67, column: 5, scope: !90)
!106 = !DILocalVariable(name: "source", scope: !107, file: !14, line: 69, type: !49)
!107 = distinct !DILexicalBlock(scope: !78, file: !14, line: 68, column: 5)
!108 = !DILocation(line: 69, column: 14, scope: !107)
!109 = !DILocation(line: 72, column: 9, scope: !107)
!110 = !DILocation(line: 73, column: 19, scope: !107)
!111 = !DILocation(line: 73, column: 9, scope: !107)
!112 = !DILocation(line: 75, column: 1, scope: !78)
