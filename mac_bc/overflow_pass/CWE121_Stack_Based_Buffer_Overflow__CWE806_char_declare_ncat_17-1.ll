; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !28
  store i8* %arraydecay, i8** %data, align 8, !dbg !29
  store i32 0, i32* %i, align 4, !dbg !30
  br label %for.cond, !dbg !32

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !33
  %cmp = icmp slt i32 %0, 1, !dbg !35
  br i1 %cmp, label %for.body, label %for.end, !dbg !36

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %data, align 8, !dbg !37
  %2 = load i8*, i8** %data, align 8, !dbg !37
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !37
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #5, !dbg !37
  %4 = load i8*, i8** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  br label %for.inc, !dbg !41

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !42
  %inc = add nsw i32 %5, 1, !dbg !42
  store i32 %inc, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !47, metadata !DIExpression()), !dbg !52
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !52
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !53
  %7 = load i8*, i8** %data, align 8, !dbg !53
  %8 = load i8*, i8** %data, align 8, !dbg !53
  %call2 = call i64 @strlen(i8* noundef %8), !dbg !53
  %call3 = call i8* @__strncat_chk(i8* noundef %arraydecay1, i8* noundef %7, i64 noundef %call2, i64 noundef 50) #5, !dbg !53
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !54
  store i8 0, i8* %arrayidx4, align 1, !dbg !55
  %9 = load i8*, i8** %data, align 8, !dbg !56
  call void @printLine(i8* noundef %9), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__strncat_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_17_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* noundef null), !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 noundef %conv), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_17_good(), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_17_bad(), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !87
  store i8* %arraydecay, i8** %data, align 8, !dbg !88
  store i32 0, i32* %h, align 4, !dbg !89
  br label %for.cond, !dbg !91

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !92
  %cmp = icmp slt i32 %0, 1, !dbg !94
  br i1 %cmp, label %for.body, label %for.end, !dbg !95

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %data, align 8, !dbg !96
  %2 = load i8*, i8** %data, align 8, !dbg !96
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !96
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #5, !dbg !96
  %4 = load i8*, i8** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  br label %for.inc, !dbg !100

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %h, align 4, !dbg !101
  %inc = add nsw i32 %5, 1, !dbg !101
  store i32 %inc, i32* %h, align 4, !dbg !101
  br label %for.cond, !dbg !102, !llvm.loop !103

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !107
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !108
  %7 = load i8*, i8** %data, align 8, !dbg !108
  %8 = load i8*, i8** %data, align 8, !dbg !108
  %call2 = call i64 @strlen(i8* noundef %8), !dbg !108
  %call3 = call i8* @__strncat_chk(i8* noundef %arraydecay1, i8* noundef %7, i64 noundef %call2, i64 noundef 50) #5, !dbg !108
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !109
  store i8 0, i8* %arrayidx4, align 1, !dbg !110
  %9 = load i8*, i8** %data, align 8, !dbg !111
  call void @printLine(i8* noundef %9), !dbg !112
  ret void, !dbg !113
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_17_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 25, column: 9, scope: !11)
!19 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DILocation(line: 26, column: 12, scope: !11)
!23 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 27, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 800, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 27, column: 10, scope: !11)
!28 = !DILocation(line: 28, column: 12, scope: !11)
!29 = !DILocation(line: 28, column: 10, scope: !11)
!30 = !DILocation(line: 29, column: 11, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!32 = !DILocation(line: 29, column: 9, scope: !31)
!33 = !DILocation(line: 29, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 29, column: 5)
!35 = !DILocation(line: 29, column: 18, scope: !34)
!36 = !DILocation(line: 29, column: 5, scope: !31)
!37 = !DILocation(line: 32, column: 9, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !12, line: 30, column: 5)
!39 = !DILocation(line: 33, column: 9, scope: !38)
!40 = !DILocation(line: 33, column: 21, scope: !38)
!41 = !DILocation(line: 34, column: 5, scope: !38)
!42 = !DILocation(line: 29, column: 24, scope: !34)
!43 = !DILocation(line: 29, column: 5, scope: !34)
!44 = distinct !{!44, !36, !45, !46}
!45 = !DILocation(line: 34, column: 5, scope: !31)
!46 = !{!"llvm.loop.mustprogress"}
!47 = !DILocalVariable(name: "dest", scope: !48, file: !12, line: 36, type: !49)
!48 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 400, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 50)
!52 = !DILocation(line: 36, column: 14, scope: !48)
!53 = !DILocation(line: 38, column: 9, scope: !48)
!54 = !DILocation(line: 39, column: 9, scope: !48)
!55 = !DILocation(line: 39, column: 20, scope: !48)
!56 = !DILocation(line: 40, column: 19, scope: !48)
!57 = !DILocation(line: 40, column: 9, scope: !48)
!58 = !DILocation(line: 42, column: 1, scope: !11)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_17_good", scope: !12, file: !12, line: 70, type: !13, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!60 = !DILocation(line: 72, column: 5, scope: !59)
!61 = !DILocation(line: 73, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 85, type: !63, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!63 = !DISubroutineType(types: !64)
!64 = !{!17, !17, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !12, line: 85, type: !17)
!67 = !DILocation(line: 85, column: 14, scope: !62)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !12, line: 85, type: !65)
!69 = !DILocation(line: 85, column: 27, scope: !62)
!70 = !DILocation(line: 88, column: 22, scope: !62)
!71 = !DILocation(line: 88, column: 12, scope: !62)
!72 = !DILocation(line: 88, column: 5, scope: !62)
!73 = !DILocation(line: 90, column: 5, scope: !62)
!74 = !DILocation(line: 91, column: 5, scope: !62)
!75 = !DILocation(line: 92, column: 5, scope: !62)
!76 = !DILocation(line: 95, column: 5, scope: !62)
!77 = !DILocation(line: 96, column: 5, scope: !62)
!78 = !DILocation(line: 97, column: 5, scope: !62)
!79 = !DILocation(line: 99, column: 5, scope: !62)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 49, type: !13, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!81 = !DILocalVariable(name: "h", scope: !80, file: !12, line: 51, type: !17)
!82 = !DILocation(line: 51, column: 9, scope: !80)
!83 = !DILocalVariable(name: "data", scope: !80, file: !12, line: 52, type: !20)
!84 = !DILocation(line: 52, column: 12, scope: !80)
!85 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !12, line: 53, type: !24)
!86 = !DILocation(line: 53, column: 10, scope: !80)
!87 = !DILocation(line: 54, column: 12, scope: !80)
!88 = !DILocation(line: 54, column: 10, scope: !80)
!89 = !DILocation(line: 55, column: 11, scope: !90)
!90 = distinct !DILexicalBlock(scope: !80, file: !12, line: 55, column: 5)
!91 = !DILocation(line: 55, column: 9, scope: !90)
!92 = !DILocation(line: 55, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !12, line: 55, column: 5)
!94 = !DILocation(line: 55, column: 18, scope: !93)
!95 = !DILocation(line: 55, column: 5, scope: !90)
!96 = !DILocation(line: 58, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !12, line: 56, column: 5)
!98 = !DILocation(line: 59, column: 9, scope: !97)
!99 = !DILocation(line: 59, column: 20, scope: !97)
!100 = !DILocation(line: 60, column: 5, scope: !97)
!101 = !DILocation(line: 55, column: 24, scope: !93)
!102 = !DILocation(line: 55, column: 5, scope: !93)
!103 = distinct !{!103, !95, !104, !46}
!104 = !DILocation(line: 60, column: 5, scope: !90)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !12, line: 62, type: !49)
!106 = distinct !DILexicalBlock(scope: !80, file: !12, line: 61, column: 5)
!107 = !DILocation(line: 62, column: 14, scope: !106)
!108 = !DILocation(line: 64, column: 9, scope: !106)
!109 = !DILocation(line: 65, column: 9, scope: !106)
!110 = !DILocation(line: 65, column: 20, scope: !106)
!111 = !DILocation(line: 66, column: 19, scope: !106)
!112 = !DILocation(line: 66, column: 9, scope: !106)
!113 = !DILocation(line: 68, column: 1, scope: !80)
