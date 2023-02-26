; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_32_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !35, metadata !DIExpression()), !dbg !37
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !38
  %1 = load i8*, i8** %0, align 8, !dbg !39
  store i8* %1, i8** %data1, align 8, !dbg !37
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store i8* %arraydecay, i8** %data1, align 8, !dbg !41
  %2 = load i8*, i8** %data1, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !42
  store i8 0, i8* %arrayidx, align 1, !dbg !43
  %3 = load i8*, i8** %data1, align 8, !dbg !44
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !45
  store i8* %3, i8** %4, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !47, metadata !DIExpression()), !dbg !49
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !50
  %6 = load i8*, i8** %5, align 8, !dbg !51
  store i8* %6, i8** %data2, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !52, metadata !DIExpression()), !dbg !54
  %7 = bitcast [11 x i8]* %source to i8*, !dbg !54
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_32_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !54
  %8 = load i8*, i8** %data2, align 8, !dbg !55
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !55
  %arraydecay4 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !55
  %call = call i64 @strlen(i8* noundef %arraydecay4), !dbg !55
  %add = add i64 %call, 1, !dbg !55
  %mul = mul i64 %add, 1, !dbg !55
  %9 = load i8*, i8** %data2, align 8, !dbg !55
  %10 = call i64 @llvm.objectsize.i64.p0i8(i8* %9, i1 false, i1 true, i1 false), !dbg !55
  %call5 = call i8* @__memmove_chk(i8* noundef %8, i8* noundef %arraydecay3, i64 noundef %mul, i64 noundef %10) #5, !dbg !55
  %11 = load i8*, i8** %data2, align 8, !dbg !56
  call void @printLine(i8* noundef %11), !dbg !57
  ret void, !dbg !58
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_32_good() #0 !dbg !59 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_32_good(), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_32_bad(), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !91, metadata !DIExpression()), !dbg !93
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !94
  %1 = load i8*, i8** %0, align 8, !dbg !95
  store i8* %1, i8** %data1, align 8, !dbg !93
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !96
  store i8* %arraydecay, i8** %data1, align 8, !dbg !97
  %2 = load i8*, i8** %data1, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  %3 = load i8*, i8** %data1, align 8, !dbg !100
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !101
  store i8* %3, i8** %4, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !103, metadata !DIExpression()), !dbg !105
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !106
  %6 = load i8*, i8** %5, align 8, !dbg !107
  store i8* %6, i8** %data2, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %7 = bitcast [11 x i8]* %source to i8*, !dbg !110
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !110
  %8 = load i8*, i8** %data2, align 8, !dbg !111
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !111
  %arraydecay4 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !111
  %call = call i64 @strlen(i8* noundef %arraydecay4), !dbg !111
  %add = add i64 %call, 1, !dbg !111
  %mul = mul i64 %add, 1, !dbg !111
  %9 = load i8*, i8** %data2, align 8, !dbg !111
  %10 = call i64 @llvm.objectsize.i64.p0i8(i8* %9, i1 false, i1 true, i1 false), !dbg !111
  %call5 = call i8* @__memmove_chk(i8* noundef %8, i8* noundef %arraydecay3, i64 noundef %mul, i64 noundef %10) #5, !dbg !111
  %11 = load i8*, i8** %data2, align 8, !dbg !112
  call void @printLine(i8* noundef %11), !dbg !113
  ret void, !dbg !114
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_32_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 30, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 31, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!22 = !DILocation(line: 31, column: 13, scope: !11)
!23 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 32, type: !21)
!24 = !DILocation(line: 32, column: 13, scope: !11)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 80, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 10)
!29 = !DILocation(line: 33, column: 10, scope: !11)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 88, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 11)
!34 = !DILocation(line: 34, column: 10, scope: !11)
!35 = !DILocalVariable(name: "data", scope: !36, file: !12, line: 36, type: !17)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!37 = !DILocation(line: 36, column: 16, scope: !36)
!38 = !DILocation(line: 36, column: 24, scope: !36)
!39 = !DILocation(line: 36, column: 23, scope: !36)
!40 = !DILocation(line: 39, column: 16, scope: !36)
!41 = !DILocation(line: 39, column: 14, scope: !36)
!42 = !DILocation(line: 40, column: 9, scope: !36)
!43 = !DILocation(line: 40, column: 17, scope: !36)
!44 = !DILocation(line: 41, column: 21, scope: !36)
!45 = !DILocation(line: 41, column: 10, scope: !36)
!46 = !DILocation(line: 41, column: 19, scope: !36)
!47 = !DILocalVariable(name: "data", scope: !48, file: !12, line: 44, type: !17)
!48 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 5)
!49 = !DILocation(line: 44, column: 16, scope: !48)
!50 = !DILocation(line: 44, column: 24, scope: !48)
!51 = !DILocation(line: 44, column: 23, scope: !48)
!52 = !DILocalVariable(name: "source", scope: !53, file: !12, line: 46, type: !31)
!53 = distinct !DILexicalBlock(scope: !48, file: !12, line: 45, column: 9)
!54 = !DILocation(line: 46, column: 18, scope: !53)
!55 = !DILocation(line: 49, column: 13, scope: !53)
!56 = !DILocation(line: 50, column: 23, scope: !53)
!57 = !DILocation(line: 50, column: 13, scope: !53)
!58 = !DILocation(line: 53, column: 1, scope: !11)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_32_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!60 = !DILocation(line: 89, column: 5, scope: !59)
!61 = !DILocation(line: 90, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 101, type: !63, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !65, !21}
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !12, line: 101, type: !65)
!67 = !DILocation(line: 101, column: 14, scope: !62)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !12, line: 101, type: !21)
!69 = !DILocation(line: 101, column: 27, scope: !62)
!70 = !DILocation(line: 104, column: 22, scope: !62)
!71 = !DILocation(line: 104, column: 12, scope: !62)
!72 = !DILocation(line: 104, column: 5, scope: !62)
!73 = !DILocation(line: 106, column: 5, scope: !62)
!74 = !DILocation(line: 107, column: 5, scope: !62)
!75 = !DILocation(line: 108, column: 5, scope: !62)
!76 = !DILocation(line: 111, column: 5, scope: !62)
!77 = !DILocation(line: 112, column: 5, scope: !62)
!78 = !DILocation(line: 113, column: 5, scope: !62)
!79 = !DILocation(line: 115, column: 5, scope: !62)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!81 = !DILocalVariable(name: "data", scope: !80, file: !12, line: 62, type: !17)
!82 = !DILocation(line: 62, column: 12, scope: !80)
!83 = !DILocalVariable(name: "dataPtr1", scope: !80, file: !12, line: 63, type: !21)
!84 = !DILocation(line: 63, column: 13, scope: !80)
!85 = !DILocalVariable(name: "dataPtr2", scope: !80, file: !12, line: 64, type: !21)
!86 = !DILocation(line: 64, column: 13, scope: !80)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !80, file: !12, line: 65, type: !26)
!88 = !DILocation(line: 65, column: 10, scope: !80)
!89 = !DILocalVariable(name: "dataGoodBuffer", scope: !80, file: !12, line: 66, type: !31)
!90 = !DILocation(line: 66, column: 10, scope: !80)
!91 = !DILocalVariable(name: "data", scope: !92, file: !12, line: 68, type: !17)
!92 = distinct !DILexicalBlock(scope: !80, file: !12, line: 67, column: 5)
!93 = !DILocation(line: 68, column: 16, scope: !92)
!94 = !DILocation(line: 68, column: 24, scope: !92)
!95 = !DILocation(line: 68, column: 23, scope: !92)
!96 = !DILocation(line: 71, column: 16, scope: !92)
!97 = !DILocation(line: 71, column: 14, scope: !92)
!98 = !DILocation(line: 72, column: 9, scope: !92)
!99 = !DILocation(line: 72, column: 17, scope: !92)
!100 = !DILocation(line: 73, column: 21, scope: !92)
!101 = !DILocation(line: 73, column: 10, scope: !92)
!102 = !DILocation(line: 73, column: 19, scope: !92)
!103 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 76, type: !17)
!104 = distinct !DILexicalBlock(scope: !80, file: !12, line: 75, column: 5)
!105 = !DILocation(line: 76, column: 16, scope: !104)
!106 = !DILocation(line: 76, column: 24, scope: !104)
!107 = !DILocation(line: 76, column: 23, scope: !104)
!108 = !DILocalVariable(name: "source", scope: !109, file: !12, line: 78, type: !31)
!109 = distinct !DILexicalBlock(scope: !104, file: !12, line: 77, column: 9)
!110 = !DILocation(line: 78, column: 18, scope: !109)
!111 = !DILocation(line: 81, column: 13, scope: !109)
!112 = !DILocation(line: 82, column: 23, scope: !109)
!113 = !DILocation(line: 82, column: 13, scope: !109)
!114 = !DILocation(line: 85, column: 1, scope: !80)
