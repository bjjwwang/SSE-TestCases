; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_17_bad() #0 !dbg !13 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 100, align 16, !dbg !25
  store i8* %0, i8** %dataBuffer, align 8, !dbg !24
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !26
  store i8* %1, i8** %data, align 8, !dbg !27
  store i32 0, i32* %i, align 4, !dbg !28
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !dbg !31
  %cmp = icmp slt i32 %2, 1, !dbg !33
  br i1 %cmp, label %for.body, label %for.end, !dbg !34

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !35
  %4 = load i8*, i8** %data, align 8, !dbg !35
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !35
  %call = call i8* @__memset_chk(i8* noundef %3, i32 noundef 65, i64 noundef 99, i64 noundef %5) #5, !dbg !35
  %6 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  br label %for.inc, !dbg !39

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !40
  %inc = add nsw i32 %7, 1, !dbg !40
  store i32 %inc, i32* %i, align 4, !dbg !40
  br label %for.cond, !dbg !41, !llvm.loop !42

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !45, metadata !DIExpression()), !dbg !50
  %8 = bitcast [50 x i8]* %dest to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 50, i1 false), !dbg !50
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !51
  %9 = load i8*, i8** %data, align 8, !dbg !51
  %call1 = call i8* @__strcat_chk(i8* noundef %arraydecay, i8* noundef %9, i64 noundef 50) #5, !dbg !51
  %10 = load i8*, i8** %data, align 8, !dbg !52
  call void @printLine(i8* noundef %10), !dbg !53
  ret void, !dbg !54
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
declare i8* @__strcat_chk(i8* noundef, i8* noundef, i64 noundef) #2

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_17_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* noundef null), !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 noundef %conv), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_17_good(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_17_bad(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 100, align 16, !dbg !83
  store i8* %0, i8** %dataBuffer, align 8, !dbg !82
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !84
  store i8* %1, i8** %data, align 8, !dbg !85
  store i32 0, i32* %h, align 4, !dbg !86
  br label %for.cond, !dbg !88

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %h, align 4, !dbg !89
  %cmp = icmp slt i32 %2, 1, !dbg !91
  br i1 %cmp, label %for.body, label %for.end, !dbg !92

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !93
  %4 = load i8*, i8** %data, align 8, !dbg !93
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !93
  %call = call i8* @__memset_chk(i8* noundef %3, i32 noundef 65, i64 noundef 49, i64 noundef %5) #5, !dbg !93
  %6 = load i8*, i8** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 49, !dbg !95
  store i8 0, i8* %arrayidx, align 1, !dbg !96
  br label %for.inc, !dbg !97

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %h, align 4, !dbg !98
  %inc = add nsw i32 %7, 1, !dbg !98
  store i32 %inc, i32* %h, align 4, !dbg !98
  br label %for.cond, !dbg !99, !llvm.loop !100

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !102, metadata !DIExpression()), !dbg !104
  %8 = bitcast [50 x i8]* %dest to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 50, i1 false), !dbg !104
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !105
  %9 = load i8*, i8** %data, align 8, !dbg !105
  %call1 = call i8* @__strcat_chk(i8* noundef %arraydecay, i8* noundef %9, i64 noundef 50) #5, !dbg !105
  %10 = load i8*, i8** %data, align 8, !dbg !106
  call void @printLine(i8* noundef %10), !dbg !107
  ret void, !dbg !108
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_17_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "i", scope: !13, file: !14, line: 25, type: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 9, scope: !13)
!21 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 26, type: !3)
!22 = !DILocation(line: 26, column: 12, scope: !13)
!23 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 27, type: !3)
!24 = !DILocation(line: 27, column: 12, scope: !13)
!25 = !DILocation(line: 27, column: 33, scope: !13)
!26 = !DILocation(line: 28, column: 12, scope: !13)
!27 = !DILocation(line: 28, column: 10, scope: !13)
!28 = !DILocation(line: 29, column: 11, scope: !29)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 5)
!30 = !DILocation(line: 29, column: 9, scope: !29)
!31 = !DILocation(line: 29, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !14, line: 29, column: 5)
!33 = !DILocation(line: 29, column: 18, scope: !32)
!34 = !DILocation(line: 29, column: 5, scope: !29)
!35 = !DILocation(line: 32, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !14, line: 30, column: 5)
!37 = !DILocation(line: 33, column: 9, scope: !36)
!38 = !DILocation(line: 33, column: 21, scope: !36)
!39 = !DILocation(line: 34, column: 5, scope: !36)
!40 = !DILocation(line: 29, column: 24, scope: !32)
!41 = !DILocation(line: 29, column: 5, scope: !32)
!42 = distinct !{!42, !34, !43, !44}
!43 = !DILocation(line: 34, column: 5, scope: !29)
!44 = !{!"llvm.loop.mustprogress"}
!45 = !DILocalVariable(name: "dest", scope: !46, file: !14, line: 36, type: !47)
!46 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 50)
!50 = !DILocation(line: 36, column: 14, scope: !46)
!51 = !DILocation(line: 38, column: 9, scope: !46)
!52 = !DILocation(line: 39, column: 19, scope: !46)
!53 = !DILocation(line: 39, column: 9, scope: !46)
!54 = !DILocation(line: 41, column: 1, scope: !13)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_17_good", scope: !14, file: !14, line: 68, type: !15, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!56 = !DILocation(line: 70, column: 5, scope: !55)
!57 = !DILocation(line: 71, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 83, type: !59, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!59 = !DISubroutineType(types: !60)
!60 = !{!19, !19, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !14, line: 83, type: !19)
!63 = !DILocation(line: 83, column: 14, scope: !58)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !14, line: 83, type: !61)
!65 = !DILocation(line: 83, column: 27, scope: !58)
!66 = !DILocation(line: 86, column: 22, scope: !58)
!67 = !DILocation(line: 86, column: 12, scope: !58)
!68 = !DILocation(line: 86, column: 5, scope: !58)
!69 = !DILocation(line: 88, column: 5, scope: !58)
!70 = !DILocation(line: 89, column: 5, scope: !58)
!71 = !DILocation(line: 90, column: 5, scope: !58)
!72 = !DILocation(line: 93, column: 5, scope: !58)
!73 = !DILocation(line: 94, column: 5, scope: !58)
!74 = !DILocation(line: 95, column: 5, scope: !58)
!75 = !DILocation(line: 97, column: 5, scope: !58)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 48, type: !15, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!77 = !DILocalVariable(name: "h", scope: !76, file: !14, line: 50, type: !19)
!78 = !DILocation(line: 50, column: 9, scope: !76)
!79 = !DILocalVariable(name: "data", scope: !76, file: !14, line: 51, type: !3)
!80 = !DILocation(line: 51, column: 12, scope: !76)
!81 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !14, line: 52, type: !3)
!82 = !DILocation(line: 52, column: 12, scope: !76)
!83 = !DILocation(line: 52, column: 33, scope: !76)
!84 = !DILocation(line: 53, column: 12, scope: !76)
!85 = !DILocation(line: 53, column: 10, scope: !76)
!86 = !DILocation(line: 54, column: 11, scope: !87)
!87 = distinct !DILexicalBlock(scope: !76, file: !14, line: 54, column: 5)
!88 = !DILocation(line: 54, column: 9, scope: !87)
!89 = !DILocation(line: 54, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !14, line: 54, column: 5)
!91 = !DILocation(line: 54, column: 18, scope: !90)
!92 = !DILocation(line: 54, column: 5, scope: !87)
!93 = !DILocation(line: 57, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !14, line: 55, column: 5)
!95 = !DILocation(line: 58, column: 9, scope: !94)
!96 = !DILocation(line: 58, column: 20, scope: !94)
!97 = !DILocation(line: 59, column: 5, scope: !94)
!98 = !DILocation(line: 54, column: 24, scope: !90)
!99 = !DILocation(line: 54, column: 5, scope: !90)
!100 = distinct !{!100, !92, !101, !44}
!101 = !DILocation(line: 59, column: 5, scope: !87)
!102 = !DILocalVariable(name: "dest", scope: !103, file: !14, line: 61, type: !47)
!103 = distinct !DILexicalBlock(scope: !76, file: !14, line: 60, column: 5)
!104 = !DILocation(line: 61, column: 14, scope: !103)
!105 = !DILocation(line: 63, column: 9, scope: !103)
!106 = !DILocation(line: 64, column: 19, scope: !103)
!107 = !DILocation(line: 64, column: 9, scope: !103)
!108 = !DILocation(line: 66, column: 1, scope: !76)
