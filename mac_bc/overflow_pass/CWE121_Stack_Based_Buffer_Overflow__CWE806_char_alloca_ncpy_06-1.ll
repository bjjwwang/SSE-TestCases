; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_06_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 100, align 16, !dbg !22
  store i8* %0, i8** %dataBuffer, align 8, !dbg !21
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !23
  store i8* %1, i8** %data, align 8, !dbg !24
  %2 = load i8*, i8** %data, align 8, !dbg !25
  %3 = load i8*, i8** %data, align 8, !dbg !25
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !25
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #5, !dbg !25
  %5 = load i8*, i8** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !30, metadata !DIExpression()), !dbg !35
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !35
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !36
  %7 = load i8*, i8** %data, align 8, !dbg !36
  %8 = load i8*, i8** %data, align 8, !dbg !36
  %call1 = call i64 @strlen(i8* noundef %8), !dbg !36
  %call2 = call i8* @__strncpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef %call1, i64 noundef 50) #5, !dbg !36
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !37
  store i8 0, i8* %arrayidx3, align 1, !dbg !38
  %9 = load i8*, i8** %data, align 8, !dbg !39
  call void @printLine(i8* noundef %9), !dbg !40
  ret void, !dbg !41
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
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_06_good() #0 !dbg !42 {
entry:
  call void @goodG2B1(), !dbg !43
  call void @goodG2B2(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* noundef null), !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 noundef %conv), !dbg !57
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_06_good(), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_06_bad(), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !65 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = alloca i8, i64 100, align 16, !dbg !70
  store i8* %0, i8** %dataBuffer, align 8, !dbg !69
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !71
  store i8* %1, i8** %data, align 8, !dbg !72
  %2 = load i8*, i8** %data, align 8, !dbg !73
  %3 = load i8*, i8** %data, align 8, !dbg !73
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !73
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !73
  %5 = load i8*, i8** %data, align 8, !dbg !76
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !76
  store i8 0, i8* %arrayidx, align 1, !dbg !77
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !78, metadata !DIExpression()), !dbg !80
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !80
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !81
  %7 = load i8*, i8** %data, align 8, !dbg !81
  %8 = load i8*, i8** %data, align 8, !dbg !81
  %call1 = call i64 @strlen(i8* noundef %8), !dbg !81
  %call2 = call i8* @__strncpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef %call1, i64 noundef 50) #5, !dbg !81
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !82
  store i8 0, i8* %arrayidx3, align 1, !dbg !83
  %9 = load i8*, i8** %data, align 8, !dbg !84
  call void @printLine(i8* noundef %9), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !87 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %0 = alloca i8, i64 100, align 16, !dbg !92
  store i8* %0, i8** %dataBuffer, align 8, !dbg !91
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !93
  store i8* %1, i8** %data, align 8, !dbg !94
  %2 = load i8*, i8** %data, align 8, !dbg !95
  %3 = load i8*, i8** %data, align 8, !dbg !95
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !95
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !95
  %5 = load i8*, i8** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !102
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !103
  %7 = load i8*, i8** %data, align 8, !dbg !103
  %8 = load i8*, i8** %data, align 8, !dbg !103
  %call1 = call i64 @strlen(i8* noundef %8), !dbg !103
  %call2 = call i8* @__strncpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef %call1, i64 noundef 50) #5, !dbg !103
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !104
  store i8 0, i8* %arrayidx3, align 1, !dbg !105
  %9 = load i8*, i8** %data, align 8, !dbg !106
  call void @printLine(i8* noundef %9), !dbg !107
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_06_bad", scope: !14, file: !14, line: 27, type: !15, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 29, type: !3)
!19 = !DILocation(line: 29, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 30, type: !3)
!21 = !DILocation(line: 30, column: 12, scope: !13)
!22 = !DILocation(line: 30, column: 33, scope: !13)
!23 = !DILocation(line: 31, column: 12, scope: !13)
!24 = !DILocation(line: 31, column: 10, scope: !13)
!25 = !DILocation(line: 35, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !27, file: !14, line: 33, column: 5)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 8)
!28 = !DILocation(line: 36, column: 9, scope: !26)
!29 = !DILocation(line: 36, column: 21, scope: !26)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !14, line: 39, type: !32)
!31 = distinct !DILexicalBlock(scope: !13, file: !14, line: 38, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 39, column: 14, scope: !31)
!36 = !DILocation(line: 41, column: 9, scope: !31)
!37 = !DILocation(line: 42, column: 9, scope: !31)
!38 = !DILocation(line: 42, column: 20, scope: !31)
!39 = !DILocation(line: 43, column: 19, scope: !31)
!40 = !DILocation(line: 43, column: 9, scope: !31)
!41 = !DILocation(line: 45, column: 1, scope: !13)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_06_good", scope: !14, file: !14, line: 98, type: !15, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!43 = !DILocation(line: 100, column: 5, scope: !42)
!44 = !DILocation(line: 101, column: 5, scope: !42)
!45 = !DILocation(line: 102, column: 1, scope: !42)
!46 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 114, type: !47, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49, !50}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !14, line: 114, type: !49)
!52 = !DILocation(line: 114, column: 14, scope: !46)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !14, line: 114, type: !50)
!54 = !DILocation(line: 114, column: 27, scope: !46)
!55 = !DILocation(line: 117, column: 22, scope: !46)
!56 = !DILocation(line: 117, column: 12, scope: !46)
!57 = !DILocation(line: 117, column: 5, scope: !46)
!58 = !DILocation(line: 119, column: 5, scope: !46)
!59 = !DILocation(line: 120, column: 5, scope: !46)
!60 = !DILocation(line: 121, column: 5, scope: !46)
!61 = !DILocation(line: 124, column: 5, scope: !46)
!62 = !DILocation(line: 125, column: 5, scope: !46)
!63 = !DILocation(line: 126, column: 5, scope: !46)
!64 = !DILocation(line: 128, column: 5, scope: !46)
!65 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 52, type: !15, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!66 = !DILocalVariable(name: "data", scope: !65, file: !14, line: 54, type: !3)
!67 = !DILocation(line: 54, column: 12, scope: !65)
!68 = !DILocalVariable(name: "dataBuffer", scope: !65, file: !14, line: 55, type: !3)
!69 = !DILocation(line: 55, column: 12, scope: !65)
!70 = !DILocation(line: 55, column: 33, scope: !65)
!71 = !DILocation(line: 56, column: 12, scope: !65)
!72 = !DILocation(line: 56, column: 10, scope: !65)
!73 = !DILocation(line: 65, column: 9, scope: !74)
!74 = distinct !DILexicalBlock(scope: !75, file: !14, line: 63, column: 5)
!75 = distinct !DILexicalBlock(scope: !65, file: !14, line: 57, column: 8)
!76 = !DILocation(line: 66, column: 9, scope: !74)
!77 = !DILocation(line: 66, column: 20, scope: !74)
!78 = !DILocalVariable(name: "dest", scope: !79, file: !14, line: 69, type: !32)
!79 = distinct !DILexicalBlock(scope: !65, file: !14, line: 68, column: 5)
!80 = !DILocation(line: 69, column: 14, scope: !79)
!81 = !DILocation(line: 71, column: 9, scope: !79)
!82 = !DILocation(line: 72, column: 9, scope: !79)
!83 = !DILocation(line: 72, column: 20, scope: !79)
!84 = !DILocation(line: 73, column: 19, scope: !79)
!85 = !DILocation(line: 73, column: 9, scope: !79)
!86 = !DILocation(line: 75, column: 1, scope: !65)
!87 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 78, type: !15, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!88 = !DILocalVariable(name: "data", scope: !87, file: !14, line: 80, type: !3)
!89 = !DILocation(line: 80, column: 12, scope: !87)
!90 = !DILocalVariable(name: "dataBuffer", scope: !87, file: !14, line: 81, type: !3)
!91 = !DILocation(line: 81, column: 12, scope: !87)
!92 = !DILocation(line: 81, column: 33, scope: !87)
!93 = !DILocation(line: 82, column: 12, scope: !87)
!94 = !DILocation(line: 82, column: 10, scope: !87)
!95 = !DILocation(line: 86, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !97, file: !14, line: 84, column: 5)
!97 = distinct !DILexicalBlock(scope: !87, file: !14, line: 83, column: 8)
!98 = !DILocation(line: 87, column: 9, scope: !96)
!99 = !DILocation(line: 87, column: 20, scope: !96)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !14, line: 90, type: !32)
!101 = distinct !DILexicalBlock(scope: !87, file: !14, line: 89, column: 5)
!102 = !DILocation(line: 90, column: 14, scope: !101)
!103 = !DILocation(line: 92, column: 9, scope: !101)
!104 = !DILocation(line: 93, column: 9, scope: !101)
!105 = !DILocation(line: 93, column: 20, scope: !101)
!106 = !DILocation(line: 94, column: 19, scope: !101)
!107 = !DILocation(line: 94, column: 9, scope: !101)
!108 = !DILocation(line: 96, column: 1, scope: !87)
