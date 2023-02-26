; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 40, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 44, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  store i32* %4, i32** %data, align 8, !dbg !32
  %5 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04_bad.source to i8*), i64 44, i1 false), !dbg !40
  %7 = load i32*, i32** %data, align 8, !dbg !41
  %8 = bitcast i32* %7 to i8*, !dbg !42
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !42
  %9 = bitcast i32* %arraydecay to i8*, !dbg !42
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !43
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !44
  %add = add i64 %call, 1, !dbg !45
  %mul = mul i64 %add, 4, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 %mul, i1 false), !dbg !42
  %10 = load i32*, i32** %data, align 8, !dbg !47
  call void @printWLine(i32* %10), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #7, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #7, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = alloca i8, i64 40, align 16, !dbg !79
  %1 = bitcast i8* %0 to i32*, !dbg !80
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %2 = alloca i8, i64 44, align 16, !dbg !83
  %3 = bitcast i8* %2 to i32*, !dbg !84
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !82
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !85
  store i32* %4, i32** %data, align 8, !dbg !88
  %5 = load i32*, i32** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !89
  store i32 0, i32* %arrayidx, align 4, !dbg !90
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !91, metadata !DIExpression()), !dbg !93
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !93
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !93
  %7 = load i32*, i32** %data, align 8, !dbg !94
  %8 = bitcast i32* %7 to i8*, !dbg !95
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !95
  %9 = bitcast i32* %arraydecay to i8*, !dbg !95
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !96
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !97
  %add = add i64 %call, 1, !dbg !98
  %mul = mul i64 %add, 4, !dbg !99
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 %mul, i1 false), !dbg !95
  %10 = load i32*, i32** %data, align 8, !dbg !100
  call void @printWLine(i32* %10), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = alloca i8, i64 40, align 16, !dbg !108
  %1 = bitcast i8* %0 to i32*, !dbg !109
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %2 = alloca i8, i64 44, align 16, !dbg !112
  %3 = bitcast i8* %2 to i32*, !dbg !113
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !111
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !114
  store i32* %4, i32** %data, align 8, !dbg !117
  %5 = load i32*, i32** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !119
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !122
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !122
  %7 = load i32*, i32** %data, align 8, !dbg !123
  %8 = bitcast i32* %7 to i8*, !dbg !124
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !124
  %9 = bitcast i32* %arraydecay to i8*, !dbg !124
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !125
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !126
  %add = add i64 %call, 1, !dbg !127
  %mul = mul i64 %add, 4, !dbg !128
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 %mul, i1 false), !dbg !124
  %10 = load i32*, i32** %data, align 8, !dbg !129
  call void @printWLine(i32* %10), !dbg !130
  ret void, !dbg !131
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
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/SVF-tools")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04_bad", scope: !16, file: !16, line: 35, type: !17, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 37, type: !4)
!20 = !DILocation(line: 37, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 38, type: !4)
!22 = !DILocation(line: 38, column: 15, scope: !15)
!23 = !DILocation(line: 38, column: 42, scope: !15)
!24 = !DILocation(line: 38, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 39, type: !4)
!26 = !DILocation(line: 39, column: 15, scope: !15)
!27 = !DILocation(line: 39, column: 43, scope: !15)
!28 = !DILocation(line: 39, column: 32, scope: !15)
!29 = !DILocation(line: 44, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !16, line: 41, column: 5)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 40, column: 8)
!32 = !DILocation(line: 44, column: 14, scope: !30)
!33 = !DILocation(line: 45, column: 9, scope: !30)
!34 = !DILocation(line: 45, column: 17, scope: !30)
!35 = !DILocalVariable(name: "source", scope: !36, file: !16, line: 48, type: !37)
!36 = distinct !DILexicalBlock(scope: !15, file: !16, line: 47, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 11)
!40 = !DILocation(line: 48, column: 17, scope: !36)
!41 = !DILocation(line: 51, column: 16, scope: !36)
!42 = !DILocation(line: 51, column: 9, scope: !36)
!43 = !DILocation(line: 51, column: 38, scope: !36)
!44 = !DILocation(line: 51, column: 31, scope: !36)
!45 = !DILocation(line: 51, column: 46, scope: !36)
!46 = !DILocation(line: 51, column: 51, scope: !36)
!47 = !DILocation(line: 52, column: 20, scope: !36)
!48 = !DILocation(line: 52, column: 9, scope: !36)
!49 = !DILocation(line: 54, column: 1, scope: !15)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04_good", scope: !16, file: !16, line: 109, type: !17, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 111, column: 5, scope: !50)
!52 = !DILocation(line: 112, column: 5, scope: !50)
!53 = !DILocation(line: 113, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 125, type: !55, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!7, !7, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !16, line: 125, type: !7)
!61 = !DILocation(line: 125, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !16, line: 125, type: !57)
!63 = !DILocation(line: 125, column: 27, scope: !54)
!64 = !DILocation(line: 128, column: 22, scope: !54)
!65 = !DILocation(line: 128, column: 12, scope: !54)
!66 = !DILocation(line: 128, column: 5, scope: !54)
!67 = !DILocation(line: 130, column: 5, scope: !54)
!68 = !DILocation(line: 131, column: 5, scope: !54)
!69 = !DILocation(line: 132, column: 5, scope: !54)
!70 = !DILocation(line: 135, column: 5, scope: !54)
!71 = !DILocation(line: 136, column: 5, scope: !54)
!72 = !DILocation(line: 137, column: 5, scope: !54)
!73 = !DILocation(line: 139, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 61, type: !17, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !16, line: 63, type: !4)
!76 = !DILocation(line: 63, column: 15, scope: !74)
!77 = !DILocalVariable(name: "dataBadBuffer", scope: !74, file: !16, line: 64, type: !4)
!78 = !DILocation(line: 64, column: 15, scope: !74)
!79 = !DILocation(line: 64, column: 42, scope: !74)
!80 = !DILocation(line: 64, column: 31, scope: !74)
!81 = !DILocalVariable(name: "dataGoodBuffer", scope: !74, file: !16, line: 65, type: !4)
!82 = !DILocation(line: 65, column: 15, scope: !74)
!83 = !DILocation(line: 65, column: 43, scope: !74)
!84 = !DILocation(line: 65, column: 32, scope: !74)
!85 = !DILocation(line: 75, column: 16, scope: !86)
!86 = distinct !DILexicalBlock(scope: !87, file: !16, line: 72, column: 5)
!87 = distinct !DILexicalBlock(scope: !74, file: !16, line: 66, column: 8)
!88 = !DILocation(line: 75, column: 14, scope: !86)
!89 = !DILocation(line: 76, column: 9, scope: !86)
!90 = !DILocation(line: 76, column: 17, scope: !86)
!91 = !DILocalVariable(name: "source", scope: !92, file: !16, line: 79, type: !37)
!92 = distinct !DILexicalBlock(scope: !74, file: !16, line: 78, column: 5)
!93 = !DILocation(line: 79, column: 17, scope: !92)
!94 = !DILocation(line: 82, column: 16, scope: !92)
!95 = !DILocation(line: 82, column: 9, scope: !92)
!96 = !DILocation(line: 82, column: 38, scope: !92)
!97 = !DILocation(line: 82, column: 31, scope: !92)
!98 = !DILocation(line: 82, column: 46, scope: !92)
!99 = !DILocation(line: 82, column: 51, scope: !92)
!100 = !DILocation(line: 83, column: 20, scope: !92)
!101 = !DILocation(line: 83, column: 9, scope: !92)
!102 = !DILocation(line: 85, column: 1, scope: !74)
!103 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 88, type: !17, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !16, line: 90, type: !4)
!105 = !DILocation(line: 90, column: 15, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !16, line: 91, type: !4)
!107 = !DILocation(line: 91, column: 15, scope: !103)
!108 = !DILocation(line: 91, column: 42, scope: !103)
!109 = !DILocation(line: 91, column: 31, scope: !103)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !16, line: 92, type: !4)
!111 = !DILocation(line: 92, column: 15, scope: !103)
!112 = !DILocation(line: 92, column: 43, scope: !103)
!113 = !DILocation(line: 92, column: 32, scope: !103)
!114 = !DILocation(line: 97, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !116, file: !16, line: 94, column: 5)
!116 = distinct !DILexicalBlock(scope: !103, file: !16, line: 93, column: 8)
!117 = !DILocation(line: 97, column: 14, scope: !115)
!118 = !DILocation(line: 98, column: 9, scope: !115)
!119 = !DILocation(line: 98, column: 17, scope: !115)
!120 = !DILocalVariable(name: "source", scope: !121, file: !16, line: 101, type: !37)
!121 = distinct !DILexicalBlock(scope: !103, file: !16, line: 100, column: 5)
!122 = !DILocation(line: 101, column: 17, scope: !121)
!123 = !DILocation(line: 104, column: 16, scope: !121)
!124 = !DILocation(line: 104, column: 9, scope: !121)
!125 = !DILocation(line: 104, column: 38, scope: !121)
!126 = !DILocation(line: 104, column: 31, scope: !121)
!127 = !DILocation(line: 104, column: 46, scope: !121)
!128 = !DILocation(line: 104, column: 51, scope: !121)
!129 = !DILocation(line: 105, column: 20, scope: !121)
!130 = !DILocation(line: 105, column: 9, scope: !121)
!131 = !DILocation(line: 107, column: 1, scope: !103)
