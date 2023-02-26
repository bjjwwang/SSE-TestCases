; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  store i32 0, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !36
  %cmp = icmp slt i32 %0, 1, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store i8* %arraydecay, i8** %data, align 8, !dbg !42
  %1 = load i8*, i8** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !43
  store i8 0, i8* %arrayidx, align 1, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !46
  %inc = add nsw i32 %2, 1, !dbg !46
  store i32 %inc, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !51, metadata !DIExpression()), !dbg !53
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !53
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !53
  %4 = load i8*, i8** %data, align 8, !dbg !54
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !54
  %5 = load i8*, i8** %data, align 8, !dbg !54
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !54
  %call = call i8* @__strcpy_chk(i8* noundef %4, i8* noundef %arraydecay1, i64 noundef %6) #5, !dbg !54
  %7 = load i8*, i8** %data, align 8, !dbg !55
  call void @printLine(i8* noundef %7), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* noundef null), !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 noundef %conv), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17_good(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17_bad(), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %h, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  store i32 0, i32* %h, align 4, !dbg !88
  br label %for.cond, !dbg !90

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !91
  %cmp = icmp slt i32 %0, 1, !dbg !93
  br i1 %cmp, label %for.body, label %for.end, !dbg !94

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !95
  store i8* %arraydecay, i8** %data, align 8, !dbg !97
  %1 = load i8*, i8** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  br label %for.inc, !dbg !100

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %h, align 4, !dbg !101
  %inc = add nsw i32 %2, 1, !dbg !101
  store i32 %inc, i32* %h, align 4, !dbg !101
  br label %for.cond, !dbg !102, !llvm.loop !103

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !107
  %4 = load i8*, i8** %data, align 8, !dbg !108
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !108
  %5 = load i8*, i8** %data, align 8, !dbg !108
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !108
  %call = call i8* @__strcpy_chk(i8* noundef %4, i8* noundef %arraydecay1, i64 noundef %6) #5, !dbg !108
  %7 = load i8*, i8** %data, align 8, !dbg !109
  call void @printLine(i8* noundef %7), !dbg !110
  ret void, !dbg !111
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 30, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 30, column: 9, scope: !11)
!19 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DILocation(line: 31, column: 12, scope: !11)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 32, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 80, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 10)
!27 = !DILocation(line: 32, column: 10, scope: !11)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 33, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 88, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 11)
!32 = !DILocation(line: 33, column: 10, scope: !11)
!33 = !DILocation(line: 34, column: 11, scope: !34)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!35 = !DILocation(line: 34, column: 9, scope: !34)
!36 = !DILocation(line: 34, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !12, line: 34, column: 5)
!38 = !DILocation(line: 34, column: 18, scope: !37)
!39 = !DILocation(line: 34, column: 5, scope: !34)
!40 = !DILocation(line: 38, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !12, line: 35, column: 5)
!42 = !DILocation(line: 38, column: 14, scope: !41)
!43 = !DILocation(line: 39, column: 9, scope: !41)
!44 = !DILocation(line: 39, column: 17, scope: !41)
!45 = !DILocation(line: 40, column: 5, scope: !41)
!46 = !DILocation(line: 34, column: 24, scope: !37)
!47 = !DILocation(line: 34, column: 5, scope: !37)
!48 = distinct !{!48, !39, !49, !50}
!49 = !DILocation(line: 40, column: 5, scope: !34)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocalVariable(name: "source", scope: !52, file: !12, line: 42, type: !29)
!52 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!53 = !DILocation(line: 42, column: 14, scope: !52)
!54 = !DILocation(line: 44, column: 9, scope: !52)
!55 = !DILocation(line: 45, column: 19, scope: !52)
!56 = !DILocation(line: 45, column: 9, scope: !52)
!57 = !DILocation(line: 47, column: 1, scope: !11)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_17_good", scope: !12, file: !12, line: 75, type: !13, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!59 = !DILocation(line: 77, column: 5, scope: !58)
!60 = !DILocation(line: 78, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 90, type: !62, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!62 = !DISubroutineType(types: !63)
!63 = !{!17, !17, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !12, line: 90, type: !17)
!66 = !DILocation(line: 90, column: 14, scope: !61)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !12, line: 90, type: !64)
!68 = !DILocation(line: 90, column: 27, scope: !61)
!69 = !DILocation(line: 93, column: 22, scope: !61)
!70 = !DILocation(line: 93, column: 12, scope: !61)
!71 = !DILocation(line: 93, column: 5, scope: !61)
!72 = !DILocation(line: 95, column: 5, scope: !61)
!73 = !DILocation(line: 96, column: 5, scope: !61)
!74 = !DILocation(line: 97, column: 5, scope: !61)
!75 = !DILocation(line: 100, column: 5, scope: !61)
!76 = !DILocation(line: 101, column: 5, scope: !61)
!77 = !DILocation(line: 102, column: 5, scope: !61)
!78 = !DILocation(line: 104, column: 5, scope: !61)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!80 = !DILocalVariable(name: "h", scope: !79, file: !12, line: 56, type: !17)
!81 = !DILocation(line: 56, column: 9, scope: !79)
!82 = !DILocalVariable(name: "data", scope: !79, file: !12, line: 57, type: !20)
!83 = !DILocation(line: 57, column: 12, scope: !79)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !79, file: !12, line: 58, type: !24)
!85 = !DILocation(line: 58, column: 10, scope: !79)
!86 = !DILocalVariable(name: "dataGoodBuffer", scope: !79, file: !12, line: 59, type: !29)
!87 = !DILocation(line: 59, column: 10, scope: !79)
!88 = !DILocation(line: 60, column: 11, scope: !89)
!89 = distinct !DILexicalBlock(scope: !79, file: !12, line: 60, column: 5)
!90 = !DILocation(line: 60, column: 9, scope: !89)
!91 = !DILocation(line: 60, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !12, line: 60, column: 5)
!93 = !DILocation(line: 60, column: 18, scope: !92)
!94 = !DILocation(line: 60, column: 5, scope: !89)
!95 = !DILocation(line: 64, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !12, line: 61, column: 5)
!97 = !DILocation(line: 64, column: 14, scope: !96)
!98 = !DILocation(line: 65, column: 9, scope: !96)
!99 = !DILocation(line: 65, column: 17, scope: !96)
!100 = !DILocation(line: 66, column: 5, scope: !96)
!101 = !DILocation(line: 60, column: 24, scope: !92)
!102 = !DILocation(line: 60, column: 5, scope: !92)
!103 = distinct !{!103, !94, !104, !50}
!104 = !DILocation(line: 66, column: 5, scope: !89)
!105 = !DILocalVariable(name: "source", scope: !106, file: !12, line: 68, type: !29)
!106 = distinct !DILexicalBlock(scope: !79, file: !12, line: 67, column: 5)
!107 = !DILocation(line: 68, column: 14, scope: !106)
!108 = !DILocation(line: 70, column: 9, scope: !106)
!109 = !DILocation(line: 71, column: 19, scope: !106)
!110 = !DILocation(line: 71, column: 9, scope: !106)
!111 = !DILocation(line: 73, column: 1, scope: !79)
