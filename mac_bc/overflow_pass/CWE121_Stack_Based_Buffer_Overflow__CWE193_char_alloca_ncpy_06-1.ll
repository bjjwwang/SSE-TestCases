; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_06_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_06_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 10, align 16, !dbg !22
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %1 = alloca i8, i64 11, align 16, !dbg !25
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !24
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !26
  store i8* %2, i8** %data, align 8, !dbg !29
  %3 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_06_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !37
  %5 = load i8*, i8** %data, align 8, !dbg !38
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !38
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !38
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !38
  %add = add i64 %call, 1, !dbg !38
  %6 = load i8*, i8** %data, align 8, !dbg !38
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !38
  %call2 = call i8* @__strncpy_chk(i8* noundef %5, i8* noundef %arraydecay, i64 noundef %add, i64 noundef %7) #5, !dbg !38
  %8 = load i8*, i8** %data, align 8, !dbg !39
  call void @printLine(i8* noundef %8), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_06_good() #0 !dbg !42 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_06_good(), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_06_bad(), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !65 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = alloca i8, i64 10, align 16, !dbg !70
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  %1 = alloca i8, i64 11, align 16, !dbg !73
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !72
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !74
  store i8* %2, i8** %data, align 8, !dbg !77
  %3 = load i8*, i8** %data, align 8, !dbg !78
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !78
  store i8 0, i8* %arrayidx, align 1, !dbg !79
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !80, metadata !DIExpression()), !dbg !82
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !82
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !82
  %5 = load i8*, i8** %data, align 8, !dbg !83
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !83
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !83
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !83
  %add = add i64 %call, 1, !dbg !83
  %6 = load i8*, i8** %data, align 8, !dbg !83
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !83
  %call2 = call i8* @__strncpy_chk(i8* noundef %5, i8* noundef %arraydecay, i64 noundef %add, i64 noundef %7) #5, !dbg !83
  %8 = load i8*, i8** %data, align 8, !dbg !84
  call void @printLine(i8* noundef %8), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !87 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %0 = alloca i8, i64 10, align 16, !dbg !92
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %1 = alloca i8, i64 11, align 16, !dbg !95
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !94
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !96
  store i8* %2, i8** %data, align 8, !dbg !99
  %3 = load i8*, i8** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !104
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !104
  %5 = load i8*, i8** %data, align 8, !dbg !105
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !105
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !105
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !105
  %add = add i64 %call, 1, !dbg !105
  %6 = load i8*, i8** %data, align 8, !dbg !105
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !105
  %call2 = call i8* @__strncpy_chk(i8* noundef %5, i8* noundef %arraydecay, i64 noundef %add, i64 noundef %7) #5, !dbg !105
  %8 = load i8*, i8** %data, align 8, !dbg !106
  call void @printLine(i8* noundef %8), !dbg !107
  ret void, !dbg !108
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_06_bad", scope: !14, file: !14, line: 32, type: !15, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 34, type: !3)
!19 = !DILocation(line: 34, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 35, type: !3)
!21 = !DILocation(line: 35, column: 12, scope: !13)
!22 = !DILocation(line: 35, column: 36, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 36, type: !3)
!24 = !DILocation(line: 36, column: 12, scope: !13)
!25 = !DILocation(line: 36, column: 37, scope: !13)
!26 = !DILocation(line: 41, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !14, line: 38, column: 5)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 8)
!29 = !DILocation(line: 41, column: 14, scope: !27)
!30 = !DILocation(line: 42, column: 9, scope: !27)
!31 = !DILocation(line: 42, column: 17, scope: !27)
!32 = !DILocalVariable(name: "source", scope: !33, file: !14, line: 45, type: !34)
!33 = distinct !DILexicalBlock(scope: !13, file: !14, line: 44, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 11)
!37 = !DILocation(line: 45, column: 14, scope: !33)
!38 = !DILocation(line: 48, column: 9, scope: !33)
!39 = !DILocation(line: 49, column: 19, scope: !33)
!40 = !DILocation(line: 49, column: 9, scope: !33)
!41 = !DILocation(line: 51, column: 1, scope: !13)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_06_good", scope: !14, file: !14, line: 106, type: !15, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!43 = !DILocation(line: 108, column: 5, scope: !42)
!44 = !DILocation(line: 109, column: 5, scope: !42)
!45 = !DILocation(line: 110, column: 1, scope: !42)
!46 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 122, type: !47, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49, !50}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !14, line: 122, type: !49)
!52 = !DILocation(line: 122, column: 14, scope: !46)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !14, line: 122, type: !50)
!54 = !DILocation(line: 122, column: 27, scope: !46)
!55 = !DILocation(line: 125, column: 22, scope: !46)
!56 = !DILocation(line: 125, column: 12, scope: !46)
!57 = !DILocation(line: 125, column: 5, scope: !46)
!58 = !DILocation(line: 127, column: 5, scope: !46)
!59 = !DILocation(line: 128, column: 5, scope: !46)
!60 = !DILocation(line: 129, column: 5, scope: !46)
!61 = !DILocation(line: 132, column: 5, scope: !46)
!62 = !DILocation(line: 133, column: 5, scope: !46)
!63 = !DILocation(line: 134, column: 5, scope: !46)
!64 = !DILocation(line: 136, column: 5, scope: !46)
!65 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 58, type: !15, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!66 = !DILocalVariable(name: "data", scope: !65, file: !14, line: 60, type: !3)
!67 = !DILocation(line: 60, column: 12, scope: !65)
!68 = !DILocalVariable(name: "dataBadBuffer", scope: !65, file: !14, line: 61, type: !3)
!69 = !DILocation(line: 61, column: 12, scope: !65)
!70 = !DILocation(line: 61, column: 36, scope: !65)
!71 = !DILocalVariable(name: "dataGoodBuffer", scope: !65, file: !14, line: 62, type: !3)
!72 = !DILocation(line: 62, column: 12, scope: !65)
!73 = !DILocation(line: 62, column: 37, scope: !65)
!74 = !DILocation(line: 72, column: 16, scope: !75)
!75 = distinct !DILexicalBlock(scope: !76, file: !14, line: 69, column: 5)
!76 = distinct !DILexicalBlock(scope: !65, file: !14, line: 63, column: 8)
!77 = !DILocation(line: 72, column: 14, scope: !75)
!78 = !DILocation(line: 73, column: 9, scope: !75)
!79 = !DILocation(line: 73, column: 17, scope: !75)
!80 = !DILocalVariable(name: "source", scope: !81, file: !14, line: 76, type: !34)
!81 = distinct !DILexicalBlock(scope: !65, file: !14, line: 75, column: 5)
!82 = !DILocation(line: 76, column: 14, scope: !81)
!83 = !DILocation(line: 79, column: 9, scope: !81)
!84 = !DILocation(line: 80, column: 19, scope: !81)
!85 = !DILocation(line: 80, column: 9, scope: !81)
!86 = !DILocation(line: 82, column: 1, scope: !65)
!87 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 85, type: !15, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!88 = !DILocalVariable(name: "data", scope: !87, file: !14, line: 87, type: !3)
!89 = !DILocation(line: 87, column: 12, scope: !87)
!90 = !DILocalVariable(name: "dataBadBuffer", scope: !87, file: !14, line: 88, type: !3)
!91 = !DILocation(line: 88, column: 12, scope: !87)
!92 = !DILocation(line: 88, column: 36, scope: !87)
!93 = !DILocalVariable(name: "dataGoodBuffer", scope: !87, file: !14, line: 89, type: !3)
!94 = !DILocation(line: 89, column: 12, scope: !87)
!95 = !DILocation(line: 89, column: 37, scope: !87)
!96 = !DILocation(line: 94, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !98, file: !14, line: 91, column: 5)
!98 = distinct !DILexicalBlock(scope: !87, file: !14, line: 90, column: 8)
!99 = !DILocation(line: 94, column: 14, scope: !97)
!100 = !DILocation(line: 95, column: 9, scope: !97)
!101 = !DILocation(line: 95, column: 17, scope: !97)
!102 = !DILocalVariable(name: "source", scope: !103, file: !14, line: 98, type: !34)
!103 = distinct !DILexicalBlock(scope: !87, file: !14, line: 97, column: 5)
!104 = !DILocation(line: 98, column: 14, scope: !103)
!105 = !DILocation(line: 101, column: 9, scope: !103)
!106 = !DILocation(line: 102, column: 19, scope: !103)
!107 = !DILocation(line: 102, column: 9, scope: !103)
!108 = !DILocation(line: 104, column: 1, scope: !87)
