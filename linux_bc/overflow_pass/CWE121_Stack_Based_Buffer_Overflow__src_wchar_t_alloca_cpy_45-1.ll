; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_goodG2BData = internal global i32* null, align 8, !dbg !12

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  store i32* %2, i32** %data, align 8, !dbg !31
  %3 = load i32*, i32** %data, align 8, !dbg !32
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !33
  %4 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %5 = load i32*, i32** %data, align 8, !dbg !36
  store i32* %5, i32** @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_badData, align 8, !dbg !37
  call void @badSink(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* null) #5, !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 %conv) #5, !dbg !55
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_good(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_bad(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @badSink() #0 !dbg !63 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_badData, align 8, !dbg !66
  store i32* %0, i32** %data, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !67, metadata !DIExpression()), !dbg !72
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !72
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !73
  %2 = load i32*, i32** %data, align 8, !dbg !74
  %call = call i32* @wcscpy(i32* %arraydecay, i32* %2) #5, !dbg !75
  %3 = load i32*, i32** %data, align 8, !dbg !76
  call void @printWLine(i32* %3), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = alloca i8, i64 400, align 16, !dbg !84
  %1 = bitcast i8* %0 to i32*, !dbg !85
  store i32* %1, i32** %dataBuffer, align 8, !dbg !83
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !86
  store i32* %2, i32** %data, align 8, !dbg !87
  %3 = load i32*, i32** %data, align 8, !dbg !88
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #5, !dbg !89
  %4 = load i32*, i32** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !90
  store i32 0, i32* %arrayidx, align 4, !dbg !91
  %5 = load i32*, i32** %data, align 8, !dbg !92
  store i32* %5, i32** @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_goodG2BData, align 8, !dbg !93
  call void @goodG2BSink(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2BSink() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_goodG2BData, align 8, !dbg !99
  store i32* %0, i32** %data, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !102
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !103
  %2 = load i32*, i32** %data, align 8, !dbg !104
  %call = call i32* @wcscpy(i32* %arraydecay, i32* %2) #5, !dbg !105
  %3 = load i32*, i32** %data, align 8, !dbg !106
  call void @printWLine(i32* %3), !dbg !107
  ret void, !dbg !108
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_badData", scope: !2, file: !14, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/SVF-tools")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_goodG2BData", scope: !2, file: !14, line: 22, type: !6, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_bad", scope: !14, file: !14, line: 37, type: !22, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 39, type: !6)
!25 = !DILocation(line: 39, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBuffer", scope: !21, file: !14, line: 40, type: !6)
!27 = !DILocation(line: 40, column: 15, scope: !21)
!28 = !DILocation(line: 40, column: 39, scope: !21)
!29 = !DILocation(line: 40, column: 28, scope: !21)
!30 = !DILocation(line: 41, column: 12, scope: !21)
!31 = !DILocation(line: 41, column: 10, scope: !21)
!32 = !DILocation(line: 43, column: 13, scope: !21)
!33 = !DILocation(line: 43, column: 5, scope: !21)
!34 = !DILocation(line: 44, column: 5, scope: !21)
!35 = !DILocation(line: 44, column: 17, scope: !21)
!36 = !DILocation(line: 45, column: 77, scope: !21)
!37 = !DILocation(line: 45, column: 75, scope: !21)
!38 = !DILocation(line: 46, column: 5, scope: !21)
!39 = !DILocation(line: 47, column: 1, scope: !21)
!40 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_good", scope: !14, file: !14, line: 77, type: !22, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!41 = !DILocation(line: 79, column: 5, scope: !40)
!42 = !DILocation(line: 80, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 91, type: !44, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DISubroutineType(types: !45)
!45 = !{!9, !9, !46}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !14, line: 91, type: !9)
!50 = !DILocation(line: 91, column: 14, scope: !43)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !14, line: 91, type: !46)
!52 = !DILocation(line: 91, column: 27, scope: !43)
!53 = !DILocation(line: 94, column: 22, scope: !43)
!54 = !DILocation(line: 94, column: 12, scope: !43)
!55 = !DILocation(line: 94, column: 5, scope: !43)
!56 = !DILocation(line: 96, column: 5, scope: !43)
!57 = !DILocation(line: 97, column: 5, scope: !43)
!58 = !DILocation(line: 98, column: 5, scope: !43)
!59 = !DILocation(line: 101, column: 5, scope: !43)
!60 = !DILocation(line: 102, column: 5, scope: !43)
!61 = !DILocation(line: 103, column: 5, scope: !43)
!62 = !DILocation(line: 105, column: 5, scope: !43)
!63 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 26, type: !22, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DILocalVariable(name: "data", scope: !63, file: !14, line: 28, type: !6)
!65 = !DILocation(line: 28, column: 15, scope: !63)
!66 = !DILocation(line: 28, column: 22, scope: !63)
!67 = !DILocalVariable(name: "dest", scope: !68, file: !14, line: 30, type: !69)
!68 = distinct !DILexicalBlock(scope: !63, file: !14, line: 29, column: 5)
!69 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !70)
!70 = !{!71}
!71 = !DISubrange(count: 50)
!72 = !DILocation(line: 30, column: 17, scope: !68)
!73 = !DILocation(line: 32, column: 16, scope: !68)
!74 = !DILocation(line: 32, column: 22, scope: !68)
!75 = !DILocation(line: 32, column: 9, scope: !68)
!76 = !DILocation(line: 33, column: 20, scope: !68)
!77 = !DILocation(line: 33, column: 9, scope: !68)
!78 = !DILocation(line: 35, column: 1, scope: !63)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 65, type: !22, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocalVariable(name: "data", scope: !79, file: !14, line: 67, type: !6)
!81 = !DILocation(line: 67, column: 15, scope: !79)
!82 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !14, line: 68, type: !6)
!83 = !DILocation(line: 68, column: 15, scope: !79)
!84 = !DILocation(line: 68, column: 39, scope: !79)
!85 = !DILocation(line: 68, column: 28, scope: !79)
!86 = !DILocation(line: 69, column: 12, scope: !79)
!87 = !DILocation(line: 69, column: 10, scope: !79)
!88 = !DILocation(line: 71, column: 13, scope: !79)
!89 = !DILocation(line: 71, column: 5, scope: !79)
!90 = !DILocation(line: 72, column: 5, scope: !79)
!91 = !DILocation(line: 72, column: 16, scope: !79)
!92 = !DILocation(line: 73, column: 81, scope: !79)
!93 = !DILocation(line: 73, column: 79, scope: !79)
!94 = !DILocation(line: 74, column: 5, scope: !79)
!95 = !DILocation(line: 75, column: 1, scope: !79)
!96 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 54, type: !22, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocalVariable(name: "data", scope: !96, file: !14, line: 56, type: !6)
!98 = !DILocation(line: 56, column: 15, scope: !96)
!99 = !DILocation(line: 56, column: 22, scope: !96)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !14, line: 58, type: !69)
!101 = distinct !DILexicalBlock(scope: !96, file: !14, line: 57, column: 5)
!102 = !DILocation(line: 58, column: 17, scope: !101)
!103 = !DILocation(line: 60, column: 16, scope: !101)
!104 = !DILocation(line: 60, column: 22, scope: !101)
!105 = !DILocation(line: 60, column: 9, scope: !101)
!106 = !DILocation(line: 61, column: 20, scope: !101)
!107 = !DILocation(line: 61, column: 9, scope: !101)
!108 = !DILocation(line: 63, column: 1, scope: !96)
