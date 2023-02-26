; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !37
  store i8* %arraydecay, i8** %data, align 8, !dbg !38
  %0 = load i8*, i8** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  %1 = load i8*, i8** %data, align 8, !dbg !41
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_34_unionType* %myUnion to i8**, !dbg !42
  store i8* %1, i8** %unionFirst, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !44, metadata !DIExpression()), !dbg !46
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_34_unionType* %myUnion to i8**, !dbg !47
  %2 = load i8*, i8** %unionSecond, align 8, !dbg !47
  store i8* %2, i8** %data1, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !48, metadata !DIExpression()), !dbg !50
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !51
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx3, align 1, !dbg !53
  %3 = load i8*, i8** %data1, align 8, !dbg !54
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !54
  %4 = load i8*, i8** %data1, align 8, !dbg !54
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !54
  %call = call i8* @__strncat_chk(i8* noundef %3, i8* noundef %arraydecay4, i64 noundef 100, i64 noundef %5) #5, !dbg !54
  %6 = load i8*, i8** %data1, align 8, !dbg !55
  call void @printLine(i8* noundef %6), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strncat_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_34_good() #0 !dbg !58 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* noundef null), !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 noundef %conv), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_34_good(), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_34_bad(), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_34_unionType* %myUnion, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !89
  store i8* %arraydecay, i8** %data, align 8, !dbg !90
  %0 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  %1 = load i8*, i8** %data, align 8, !dbg !93
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_34_unionType* %myUnion to i8**, !dbg !94
  store i8* %1, i8** %unionFirst, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !96, metadata !DIExpression()), !dbg !98
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_34_unionType* %myUnion to i8**, !dbg !99
  %2 = load i8*, i8** %unionSecond, align 8, !dbg !99
  store i8* %2, i8** %data1, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !103
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !104
  store i8 0, i8* %arrayidx3, align 1, !dbg !105
  %3 = load i8*, i8** %data1, align 8, !dbg !106
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !106
  %4 = load i8*, i8** %data1, align 8, !dbg !106
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !106
  %call = call i8* @__strncat_chk(i8* noundef %3, i8* noundef %arraydecay4, i64 noundef 100, i64 noundef %5) #5, !dbg !106
  %6 = load i8*, i8** %data1, align 8, !dbg !107
  call void @printLine(i8* noundef %6), !dbg !108
  ret void, !dbg !109
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 31, column: 12, scope: !11)
!20 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_34_unionType", file: !12, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !12, line: 23, baseType: !17, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !12, line: 24, baseType: !17, size: 64)
!26 = !DILocation(line: 32, column: 79, scope: !11)
!27 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 50)
!31 = !DILocation(line: 33, column: 10, scope: !11)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 34, column: 10, scope: !11)
!37 = !DILocation(line: 37, column: 12, scope: !11)
!38 = !DILocation(line: 37, column: 10, scope: !11)
!39 = !DILocation(line: 38, column: 5, scope: !11)
!40 = !DILocation(line: 38, column: 13, scope: !11)
!41 = !DILocation(line: 39, column: 26, scope: !11)
!42 = !DILocation(line: 39, column: 13, scope: !11)
!43 = !DILocation(line: 39, column: 24, scope: !11)
!44 = !DILocalVariable(name: "data", scope: !45, file: !12, line: 41, type: !17)
!45 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!46 = !DILocation(line: 41, column: 16, scope: !45)
!47 = !DILocation(line: 41, column: 31, scope: !45)
!48 = !DILocalVariable(name: "source", scope: !49, file: !12, line: 43, type: !33)
!49 = distinct !DILexicalBlock(scope: !45, file: !12, line: 42, column: 9)
!50 = !DILocation(line: 43, column: 18, scope: !49)
!51 = !DILocation(line: 44, column: 13, scope: !49)
!52 = !DILocation(line: 45, column: 13, scope: !49)
!53 = !DILocation(line: 45, column: 27, scope: !49)
!54 = !DILocation(line: 47, column: 13, scope: !49)
!55 = !DILocation(line: 48, column: 23, scope: !49)
!56 = !DILocation(line: 48, column: 13, scope: !49)
!57 = !DILocation(line: 51, column: 1, scope: !11)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_34_good", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!59 = !DILocation(line: 83, column: 5, scope: !58)
!60 = !DILocation(line: 84, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 95, type: !62, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!62 = !DISubroutineType(types: !63)
!63 = !{!64, !64, !65}
!64 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !12, line: 95, type: !64)
!67 = !DILocation(line: 95, column: 14, scope: !61)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !12, line: 95, type: !65)
!69 = !DILocation(line: 95, column: 27, scope: !61)
!70 = !DILocation(line: 98, column: 22, scope: !61)
!71 = !DILocation(line: 98, column: 12, scope: !61)
!72 = !DILocation(line: 98, column: 5, scope: !61)
!73 = !DILocation(line: 100, column: 5, scope: !61)
!74 = !DILocation(line: 101, column: 5, scope: !61)
!75 = !DILocation(line: 102, column: 5, scope: !61)
!76 = !DILocation(line: 105, column: 5, scope: !61)
!77 = !DILocation(line: 106, column: 5, scope: !61)
!78 = !DILocation(line: 107, column: 5, scope: !61)
!79 = !DILocation(line: 109, column: 5, scope: !61)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 58, type: !13, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!81 = !DILocalVariable(name: "data", scope: !80, file: !12, line: 60, type: !17)
!82 = !DILocation(line: 60, column: 12, scope: !80)
!83 = !DILocalVariable(name: "myUnion", scope: !80, file: !12, line: 61, type: !21)
!84 = !DILocation(line: 61, column: 79, scope: !80)
!85 = !DILocalVariable(name: "dataBadBuffer", scope: !80, file: !12, line: 62, type: !28)
!86 = !DILocation(line: 62, column: 10, scope: !80)
!87 = !DILocalVariable(name: "dataGoodBuffer", scope: !80, file: !12, line: 63, type: !33)
!88 = !DILocation(line: 63, column: 10, scope: !80)
!89 = !DILocation(line: 65, column: 12, scope: !80)
!90 = !DILocation(line: 65, column: 10, scope: !80)
!91 = !DILocation(line: 66, column: 5, scope: !80)
!92 = !DILocation(line: 66, column: 13, scope: !80)
!93 = !DILocation(line: 67, column: 26, scope: !80)
!94 = !DILocation(line: 67, column: 13, scope: !80)
!95 = !DILocation(line: 67, column: 24, scope: !80)
!96 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 69, type: !17)
!97 = distinct !DILexicalBlock(scope: !80, file: !12, line: 68, column: 5)
!98 = !DILocation(line: 69, column: 16, scope: !97)
!99 = !DILocation(line: 69, column: 31, scope: !97)
!100 = !DILocalVariable(name: "source", scope: !101, file: !12, line: 71, type: !33)
!101 = distinct !DILexicalBlock(scope: !97, file: !12, line: 70, column: 9)
!102 = !DILocation(line: 71, column: 18, scope: !101)
!103 = !DILocation(line: 72, column: 13, scope: !101)
!104 = !DILocation(line: 73, column: 13, scope: !101)
!105 = !DILocation(line: 73, column: 27, scope: !101)
!106 = !DILocation(line: 75, column: 13, scope: !101)
!107 = !DILocation(line: 76, column: 23, scope: !101)
!108 = !DILocation(line: 76, column: 13, scope: !101)
!109 = !DILocation(line: 79, column: 1, scope: !80)
