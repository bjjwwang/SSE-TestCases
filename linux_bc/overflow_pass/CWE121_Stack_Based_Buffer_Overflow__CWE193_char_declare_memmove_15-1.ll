; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  store i8* %arraydecay, i8** %data, align 8, !dbg !30
  %0 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !33, metadata !DIExpression()), !dbg !35
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !35
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !35
  %2 = load i8*, i8** %data, align 8, !dbg !36
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !37
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !38
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !39
  %add = add i64 %call, 1, !dbg !40
  %mul = mul i64 %add, 1, !dbg !41
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %arraydecay1, i64 %mul, i1 false), !dbg !37
  %3 = load i8*, i8** %data, align 8, !dbg !42
  call void @printLine(i8* %3), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15_good() #0 !dbg !45 {
entry:
  call void @goodG2B1(), !dbg !46
  call void @goodG2B2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #7, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #7, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !68 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !75
  store i8* %arraydecay, i8** %data, align 8, !dbg !76
  %0 = load i8*, i8** %data, align 8, !dbg !77
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !77
  store i8 0, i8* %arrayidx, align 1, !dbg !78
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !79, metadata !DIExpression()), !dbg !81
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !81
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !81
  %2 = load i8*, i8** %data, align 8, !dbg !82
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !83
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !84
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !85
  %add = add i64 %call, 1, !dbg !86
  %mul = mul i64 %add, 1, !dbg !87
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %arraydecay1, i64 %mul, i1 false), !dbg !83
  %3 = load i8*, i8** %data, align 8, !dbg !88
  call void @printLine(i8* %3), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !91 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !98
  store i8* %arraydecay, i8** %data, align 8, !dbg !99
  %0 = load i8*, i8** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !104
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !104
  %2 = load i8*, i8** %data, align 8, !dbg !105
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !106
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !107
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !108
  %add = add i64 %call, 1, !dbg !109
  %mul = mul i64 %add, 1, !dbg !110
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %arraydecay1, i64 %mul, i1 false), !dbg !106
  %3 = load i8*, i8** %data, align 8, !dbg !111
  call void @printLine(i8* %3), !dbg !112
  ret void, !dbg !113
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 30, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 10)
!23 = !DILocation(line: 31, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 11)
!28 = !DILocation(line: 32, column: 10, scope: !11)
!29 = !DILocation(line: 38, column: 16, scope: !11)
!30 = !DILocation(line: 38, column: 14, scope: !11)
!31 = !DILocation(line: 39, column: 9, scope: !11)
!32 = !DILocation(line: 39, column: 17, scope: !11)
!33 = !DILocalVariable(name: "source", scope: !34, file: !12, line: 47, type: !25)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 5)
!35 = !DILocation(line: 47, column: 14, scope: !34)
!36 = !DILocation(line: 50, column: 17, scope: !34)
!37 = !DILocation(line: 50, column: 9, scope: !34)
!38 = !DILocation(line: 50, column: 39, scope: !34)
!39 = !DILocation(line: 50, column: 32, scope: !34)
!40 = !DILocation(line: 50, column: 47, scope: !34)
!41 = !DILocation(line: 50, column: 52, scope: !34)
!42 = !DILocation(line: 51, column: 19, scope: !34)
!43 = !DILocation(line: 51, column: 9, scope: !34)
!44 = !DILocation(line: 53, column: 1, scope: !11)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15_good", scope: !12, file: !12, line: 115, type: !13, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 117, column: 5, scope: !45)
!47 = !DILocation(line: 118, column: 5, scope: !45)
!48 = !DILocation(line: 119, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 131, type: !50, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !52, !53}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !12, line: 131, type: !52)
!55 = !DILocation(line: 131, column: 14, scope: !49)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !12, line: 131, type: !53)
!57 = !DILocation(line: 131, column: 27, scope: !49)
!58 = !DILocation(line: 134, column: 22, scope: !49)
!59 = !DILocation(line: 134, column: 12, scope: !49)
!60 = !DILocation(line: 134, column: 5, scope: !49)
!61 = !DILocation(line: 136, column: 5, scope: !49)
!62 = !DILocation(line: 137, column: 5, scope: !49)
!63 = !DILocation(line: 138, column: 5, scope: !49)
!64 = !DILocation(line: 141, column: 5, scope: !49)
!65 = !DILocation(line: 142, column: 5, scope: !49)
!66 = !DILocation(line: 143, column: 5, scope: !49)
!67 = !DILocation(line: 145, column: 5, scope: !49)
!68 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "data", scope: !68, file: !12, line: 62, type: !16)
!70 = !DILocation(line: 62, column: 12, scope: !68)
!71 = !DILocalVariable(name: "dataBadBuffer", scope: !68, file: !12, line: 63, type: !20)
!72 = !DILocation(line: 63, column: 10, scope: !68)
!73 = !DILocalVariable(name: "dataGoodBuffer", scope: !68, file: !12, line: 64, type: !25)
!74 = !DILocation(line: 64, column: 10, scope: !68)
!75 = !DILocation(line: 74, column: 16, scope: !68)
!76 = !DILocation(line: 74, column: 14, scope: !68)
!77 = !DILocation(line: 75, column: 9, scope: !68)
!78 = !DILocation(line: 75, column: 17, scope: !68)
!79 = !DILocalVariable(name: "source", scope: !80, file: !12, line: 79, type: !25)
!80 = distinct !DILexicalBlock(scope: !68, file: !12, line: 78, column: 5)
!81 = !DILocation(line: 79, column: 14, scope: !80)
!82 = !DILocation(line: 82, column: 17, scope: !80)
!83 = !DILocation(line: 82, column: 9, scope: !80)
!84 = !DILocation(line: 82, column: 39, scope: !80)
!85 = !DILocation(line: 82, column: 32, scope: !80)
!86 = !DILocation(line: 82, column: 47, scope: !80)
!87 = !DILocation(line: 82, column: 52, scope: !80)
!88 = !DILocation(line: 83, column: 19, scope: !80)
!89 = !DILocation(line: 83, column: 9, scope: !80)
!90 = !DILocation(line: 85, column: 1, scope: !68)
!91 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !12, line: 90, type: !16)
!93 = !DILocation(line: 90, column: 12, scope: !91)
!94 = !DILocalVariable(name: "dataBadBuffer", scope: !91, file: !12, line: 91, type: !20)
!95 = !DILocation(line: 91, column: 10, scope: !91)
!96 = !DILocalVariable(name: "dataGoodBuffer", scope: !91, file: !12, line: 92, type: !25)
!97 = !DILocation(line: 92, column: 10, scope: !91)
!98 = !DILocation(line: 98, column: 16, scope: !91)
!99 = !DILocation(line: 98, column: 14, scope: !91)
!100 = !DILocation(line: 99, column: 9, scope: !91)
!101 = !DILocation(line: 99, column: 17, scope: !91)
!102 = !DILocalVariable(name: "source", scope: !103, file: !12, line: 107, type: !25)
!103 = distinct !DILexicalBlock(scope: !91, file: !12, line: 106, column: 5)
!104 = !DILocation(line: 107, column: 14, scope: !103)
!105 = !DILocation(line: 110, column: 17, scope: !103)
!106 = !DILocation(line: 110, column: 9, scope: !103)
!107 = !DILocation(line: 110, column: 39, scope: !103)
!108 = !DILocation(line: 110, column: 32, scope: !103)
!109 = !DILocation(line: 110, column: 47, scope: !103)
!110 = !DILocation(line: 110, column: 52, scope: !103)
!111 = !DILocation(line: 111, column: 19, scope: !103)
!112 = !DILocation(line: 111, column: 9, scope: !103)
!113 = !DILocation(line: 113, column: 1, scope: !91)
