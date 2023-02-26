; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_17_bad() #0 !dbg !13 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 50, align 16, !dbg !25
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %1 = alloca i8, i64 100, align 16, !dbg !28
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
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !53
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !54
  store i8 0, i8* %arrayidx1, align 1, !dbg !55
  %6 = load i8*, i8** %data, align 8, !dbg !56
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !56
  %7 = load i8*, i8** %data, align 8, !dbg !56
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !56
  %call = call i8* @__strcpy_chk(i8* noundef %6, i8* noundef %arraydecay2, i64 noundef %8) #5, !dbg !56
  %9 = load i8*, i8** %data, align 8, !dbg !57
  call void @printLine(i8* noundef %9), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_17_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* noundef null), !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 noundef %conv), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_17_good(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_17_bad(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = alloca i8, i64 50, align 16, !dbg !88
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %1 = alloca i8, i64 100, align 16, !dbg !91
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !90
  store i32 0, i32* %h, align 4, !dbg !92
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %h, align 4, !dbg !95
  %cmp = icmp slt i32 %2, 1, !dbg !97
  br i1 %cmp, label %for.body, label %for.end, !dbg !98

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !99
  store i8* %3, i8** %data, align 8, !dbg !101
  %4 = load i8*, i8** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  br label %for.inc, !dbg !104

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %h, align 4, !dbg !105
  %inc = add nsw i32 %5, 1, !dbg !105
  store i32 %inc, i32* %h, align 4, !dbg !105
  br label %for.cond, !dbg !106, !llvm.loop !107

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !112
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !113
  store i8 0, i8* %arrayidx1, align 1, !dbg !114
  %6 = load i8*, i8** %data, align 8, !dbg !115
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !115
  %7 = load i8*, i8** %data, align 8, !dbg !115
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !115
  %call = call i8* @__strcpy_chk(i8* noundef %6, i8* noundef %arraydecay2, i64 noundef %8) #5, !dbg !115
  %9 = load i8*, i8** %data, align 8, !dbg !116
  call void @printLine(i8* noundef %9), !dbg !117
  ret void, !dbg !118
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_17_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "i", scope: !13, file: !14, line: 25, type: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 9, scope: !13)
!21 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 26, type: !3)
!22 = !DILocation(line: 26, column: 12, scope: !13)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 27, type: !3)
!24 = !DILocation(line: 27, column: 12, scope: !13)
!25 = !DILocation(line: 27, column: 36, scope: !13)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 28, type: !3)
!27 = !DILocation(line: 28, column: 12, scope: !13)
!28 = !DILocation(line: 28, column: 37, scope: !13)
!29 = !DILocation(line: 29, column: 11, scope: !30)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 5)
!31 = !DILocation(line: 29, column: 9, scope: !30)
!32 = !DILocation(line: 29, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !14, line: 29, column: 5)
!34 = !DILocation(line: 29, column: 18, scope: !33)
!35 = !DILocation(line: 29, column: 5, scope: !30)
!36 = !DILocation(line: 33, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !14, line: 30, column: 5)
!38 = !DILocation(line: 33, column: 14, scope: !37)
!39 = !DILocation(line: 34, column: 9, scope: !37)
!40 = !DILocation(line: 34, column: 17, scope: !37)
!41 = !DILocation(line: 35, column: 5, scope: !37)
!42 = !DILocation(line: 29, column: 24, scope: !33)
!43 = !DILocation(line: 29, column: 5, scope: !33)
!44 = distinct !{!44, !35, !45, !46}
!45 = !DILocation(line: 35, column: 5, scope: !30)
!46 = !{!"llvm.loop.mustprogress"}
!47 = !DILocalVariable(name: "source", scope: !48, file: !14, line: 37, type: !49)
!48 = distinct !DILexicalBlock(scope: !13, file: !14, line: 36, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 37, column: 14, scope: !48)
!53 = !DILocation(line: 38, column: 9, scope: !48)
!54 = !DILocation(line: 39, column: 9, scope: !48)
!55 = !DILocation(line: 39, column: 23, scope: !48)
!56 = !DILocation(line: 41, column: 9, scope: !48)
!57 = !DILocation(line: 42, column: 19, scope: !48)
!58 = !DILocation(line: 42, column: 9, scope: !48)
!59 = !DILocation(line: 44, column: 1, scope: !13)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_17_good", scope: !14, file: !14, line: 73, type: !15, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!61 = !DILocation(line: 75, column: 5, scope: !60)
!62 = !DILocation(line: 76, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 88, type: !64, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!64 = !DISubroutineType(types: !65)
!65 = !{!19, !19, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !14, line: 88, type: !19)
!68 = !DILocation(line: 88, column: 14, scope: !63)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !14, line: 88, type: !66)
!70 = !DILocation(line: 88, column: 27, scope: !63)
!71 = !DILocation(line: 91, column: 22, scope: !63)
!72 = !DILocation(line: 91, column: 12, scope: !63)
!73 = !DILocation(line: 91, column: 5, scope: !63)
!74 = !DILocation(line: 93, column: 5, scope: !63)
!75 = !DILocation(line: 94, column: 5, scope: !63)
!76 = !DILocation(line: 95, column: 5, scope: !63)
!77 = !DILocation(line: 98, column: 5, scope: !63)
!78 = !DILocation(line: 99, column: 5, scope: !63)
!79 = !DILocation(line: 100, column: 5, scope: !63)
!80 = !DILocation(line: 102, column: 5, scope: !63)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!82 = !DILocalVariable(name: "h", scope: !81, file: !14, line: 53, type: !19)
!83 = !DILocation(line: 53, column: 9, scope: !81)
!84 = !DILocalVariable(name: "data", scope: !81, file: !14, line: 54, type: !3)
!85 = !DILocation(line: 54, column: 12, scope: !81)
!86 = !DILocalVariable(name: "dataBadBuffer", scope: !81, file: !14, line: 55, type: !3)
!87 = !DILocation(line: 55, column: 12, scope: !81)
!88 = !DILocation(line: 55, column: 36, scope: !81)
!89 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !14, line: 56, type: !3)
!90 = !DILocation(line: 56, column: 12, scope: !81)
!91 = !DILocation(line: 56, column: 37, scope: !81)
!92 = !DILocation(line: 57, column: 11, scope: !93)
!93 = distinct !DILexicalBlock(scope: !81, file: !14, line: 57, column: 5)
!94 = !DILocation(line: 57, column: 9, scope: !93)
!95 = !DILocation(line: 57, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !14, line: 57, column: 5)
!97 = !DILocation(line: 57, column: 18, scope: !96)
!98 = !DILocation(line: 57, column: 5, scope: !93)
!99 = !DILocation(line: 60, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !14, line: 58, column: 5)
!101 = !DILocation(line: 60, column: 14, scope: !100)
!102 = !DILocation(line: 61, column: 9, scope: !100)
!103 = !DILocation(line: 61, column: 17, scope: !100)
!104 = !DILocation(line: 62, column: 5, scope: !100)
!105 = !DILocation(line: 57, column: 24, scope: !96)
!106 = !DILocation(line: 57, column: 5, scope: !96)
!107 = distinct !{!107, !98, !108, !46}
!108 = !DILocation(line: 62, column: 5, scope: !93)
!109 = !DILocalVariable(name: "source", scope: !110, file: !14, line: 64, type: !49)
!110 = distinct !DILexicalBlock(scope: !81, file: !14, line: 63, column: 5)
!111 = !DILocation(line: 64, column: 14, scope: !110)
!112 = !DILocation(line: 65, column: 9, scope: !110)
!113 = !DILocation(line: 66, column: 9, scope: !110)
!114 = !DILocation(line: 66, column: 23, scope: !110)
!115 = !DILocation(line: 68, column: 9, scope: !110)
!116 = !DILocation(line: 69, column: 19, scope: !110)
!117 = !DILocation(line: 69, column: 9, scope: !110)
!118 = !DILocation(line: 71, column: 1, scope: !81)
