; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !30
  store i8* %arraydecay, i8** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !32, metadata !DIExpression()), !dbg !34
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !35
  %1 = load i8*, i8** %0, align 8, !dbg !36
  store i8* %1, i8** %data1, align 8, !dbg !34
  %2 = load i8*, i8** %data1, align 8, !dbg !37
  %3 = load i8*, i8** %data1, align 8, !dbg !37
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !37
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #5, !dbg !37
  %5 = load i8*, i8** %data1, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %6 = load i8*, i8** %data1, align 8, !dbg !40
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !41
  store i8* %6, i8** %7, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !43, metadata !DIExpression()), !dbg !45
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !46
  %9 = load i8*, i8** %8, align 8, !dbg !47
  store i8* %9, i8** %data2, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !48, metadata !DIExpression()), !dbg !53
  %10 = bitcast [50 x i8]* %dest to i8*, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 50, i1 false), !dbg !53
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !54
  %11 = load i8*, i8** %data2, align 8, !dbg !54
  %12 = load i8*, i8** %data2, align 8, !dbg !54
  %call4 = call i64 @strlen(i8* noundef %12), !dbg !54
  %mul = mul i64 %call4, 1, !dbg !54
  %call5 = call i8* @__memcpy_chk(i8* noundef %arraydecay3, i8* noundef %11, i64 noundef %mul, i64 noundef 50) #5, !dbg !54
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !55
  store i8 0, i8* %arrayidx6, align 1, !dbg !56
  %13 = load i8*, i8** %data2, align 8, !dbg !57
  call void @printLine(i8* noundef %13), !dbg !58
  ret void, !dbg !59
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
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_32_good() #0 !dbg !60 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_32_good(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_32_bad(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !90
  store i8* %arraydecay, i8** %data, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !92, metadata !DIExpression()), !dbg !94
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !95
  %1 = load i8*, i8** %0, align 8, !dbg !96
  store i8* %1, i8** %data1, align 8, !dbg !94
  %2 = load i8*, i8** %data1, align 8, !dbg !97
  %3 = load i8*, i8** %data1, align 8, !dbg !97
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !97
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !97
  %5 = load i8*, i8** %data1, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  %6 = load i8*, i8** %data1, align 8, !dbg !100
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !101
  store i8* %6, i8** %7, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !103, metadata !DIExpression()), !dbg !105
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !106
  %9 = load i8*, i8** %8, align 8, !dbg !107
  store i8* %9, i8** %data2, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !108, metadata !DIExpression()), !dbg !110
  %10 = bitcast [50 x i8]* %dest to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 50, i1 false), !dbg !110
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !111
  %11 = load i8*, i8** %data2, align 8, !dbg !111
  %12 = load i8*, i8** %data2, align 8, !dbg !111
  %call4 = call i64 @strlen(i8* noundef %12), !dbg !111
  %mul = mul i64 %call4, 1, !dbg !111
  %call5 = call i8* @__memcpy_chk(i8* noundef %arraydecay3, i8* noundef %11, i64 noundef %mul, i64 noundef 50) #5, !dbg !111
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !112
  store i8 0, i8* %arrayidx6, align 1, !dbg !113
  %13 = load i8*, i8** %data2, align 8, !dbg !114
  call void @printLine(i8* noundef %13), !dbg !115
  ret void, !dbg !116
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 25, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 26, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!22 = !DILocation(line: 26, column: 13, scope: !11)
!23 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 27, type: !21)
!24 = !DILocation(line: 27, column: 13, scope: !11)
!25 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 28, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 28, column: 10, scope: !11)
!30 = !DILocation(line: 29, column: 12, scope: !11)
!31 = !DILocation(line: 29, column: 10, scope: !11)
!32 = !DILocalVariable(name: "data", scope: !33, file: !12, line: 31, type: !17)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!34 = !DILocation(line: 31, column: 16, scope: !33)
!35 = !DILocation(line: 31, column: 24, scope: !33)
!36 = !DILocation(line: 31, column: 23, scope: !33)
!37 = !DILocation(line: 33, column: 9, scope: !33)
!38 = !DILocation(line: 34, column: 9, scope: !33)
!39 = !DILocation(line: 34, column: 21, scope: !33)
!40 = !DILocation(line: 35, column: 21, scope: !33)
!41 = !DILocation(line: 35, column: 10, scope: !33)
!42 = !DILocation(line: 35, column: 19, scope: !33)
!43 = !DILocalVariable(name: "data", scope: !44, file: !12, line: 38, type: !17)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!45 = !DILocation(line: 38, column: 16, scope: !44)
!46 = !DILocation(line: 38, column: 24, scope: !44)
!47 = !DILocation(line: 38, column: 23, scope: !44)
!48 = !DILocalVariable(name: "dest", scope: !49, file: !12, line: 40, type: !50)
!49 = distinct !DILexicalBlock(scope: !44, file: !12, line: 39, column: 9)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 50)
!53 = !DILocation(line: 40, column: 18, scope: !49)
!54 = !DILocation(line: 42, column: 13, scope: !49)
!55 = !DILocation(line: 43, column: 13, scope: !49)
!56 = !DILocation(line: 43, column: 24, scope: !49)
!57 = !DILocation(line: 44, column: 23, scope: !49)
!58 = !DILocation(line: 44, column: 13, scope: !49)
!59 = !DILocation(line: 47, column: 1, scope: !11)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_32_good", scope: !12, file: !12, line: 80, type: !13, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!61 = !DILocation(line: 82, column: 5, scope: !60)
!62 = !DILocation(line: 83, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 94, type: !64, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !21}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !12, line: 94, type: !66)
!68 = !DILocation(line: 94, column: 14, scope: !63)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !12, line: 94, type: !21)
!70 = !DILocation(line: 94, column: 27, scope: !63)
!71 = !DILocation(line: 97, column: 22, scope: !63)
!72 = !DILocation(line: 97, column: 12, scope: !63)
!73 = !DILocation(line: 97, column: 5, scope: !63)
!74 = !DILocation(line: 99, column: 5, scope: !63)
!75 = !DILocation(line: 100, column: 5, scope: !63)
!76 = !DILocation(line: 101, column: 5, scope: !63)
!77 = !DILocation(line: 104, column: 5, scope: !63)
!78 = !DILocation(line: 105, column: 5, scope: !63)
!79 = !DILocation(line: 106, column: 5, scope: !63)
!80 = !DILocation(line: 108, column: 5, scope: !63)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!82 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 56, type: !17)
!83 = !DILocation(line: 56, column: 12, scope: !81)
!84 = !DILocalVariable(name: "dataPtr1", scope: !81, file: !12, line: 57, type: !21)
!85 = !DILocation(line: 57, column: 13, scope: !81)
!86 = !DILocalVariable(name: "dataPtr2", scope: !81, file: !12, line: 58, type: !21)
!87 = !DILocation(line: 58, column: 13, scope: !81)
!88 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !12, line: 59, type: !26)
!89 = !DILocation(line: 59, column: 10, scope: !81)
!90 = !DILocation(line: 60, column: 12, scope: !81)
!91 = !DILocation(line: 60, column: 10, scope: !81)
!92 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 62, type: !17)
!93 = distinct !DILexicalBlock(scope: !81, file: !12, line: 61, column: 5)
!94 = !DILocation(line: 62, column: 16, scope: !93)
!95 = !DILocation(line: 62, column: 24, scope: !93)
!96 = !DILocation(line: 62, column: 23, scope: !93)
!97 = !DILocation(line: 64, column: 9, scope: !93)
!98 = !DILocation(line: 65, column: 9, scope: !93)
!99 = !DILocation(line: 65, column: 20, scope: !93)
!100 = !DILocation(line: 66, column: 21, scope: !93)
!101 = !DILocation(line: 66, column: 10, scope: !93)
!102 = !DILocation(line: 66, column: 19, scope: !93)
!103 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 69, type: !17)
!104 = distinct !DILexicalBlock(scope: !81, file: !12, line: 68, column: 5)
!105 = !DILocation(line: 69, column: 16, scope: !104)
!106 = !DILocation(line: 69, column: 24, scope: !104)
!107 = !DILocation(line: 69, column: 23, scope: !104)
!108 = !DILocalVariable(name: "dest", scope: !109, file: !12, line: 71, type: !50)
!109 = distinct !DILexicalBlock(scope: !104, file: !12, line: 70, column: 9)
!110 = !DILocation(line: 71, column: 18, scope: !109)
!111 = !DILocation(line: 73, column: 13, scope: !109)
!112 = !DILocation(line: 74, column: 13, scope: !109)
!113 = !DILocation(line: 74, column: 24, scope: !109)
!114 = !DILocation(line: 75, column: 23, scope: !109)
!115 = !DILocation(line: 75, column: 13, scope: !109)
!116 = !DILocation(line: 78, column: 1, scope: !81)
