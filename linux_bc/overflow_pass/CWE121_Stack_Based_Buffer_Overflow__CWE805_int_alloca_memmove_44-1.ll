; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_44-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_44-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_44_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %4, i32** %data, align 8, !dbg !33
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !34
  %6 = load i32*, i32** %data, align 8, !dbg !35
  call void %5(i32* %6), !dbg !34
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @badSink(i32* %data) #0 !dbg !37 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !45
  %1 = load i32*, i32** %data.addr, align 8, !dbg !46
  %2 = bitcast i32* %1 to i8*, !dbg !47
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %3 = bitcast i32* %arraydecay to i8*, !dbg !47
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !47
  %4 = load i32*, i32** %data.addr, align 8, !dbg !48
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !48
  %5 = load i32, i32* %arrayidx, align 4, !dbg !48
  call void @printIntLine(i32 %5), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_44_good() #0 !dbg !51 {
entry:
  call void @goodG2B(), !dbg !52
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
  %call = call i64 @time(i64* null) #6, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #6, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_44_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_44_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !77, metadata !DIExpression()), !dbg !78
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 200, align 16, !dbg !81
  %1 = bitcast i8* %0 to i32*, !dbg !82
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %2 = alloca i8, i64 400, align 16, !dbg !85
  %3 = bitcast i8* %2 to i32*, !dbg !86
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !84
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !87
  store i32* %4, i32** %data, align 8, !dbg !88
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !89
  %6 = load i32*, i32** %data, align 8, !dbg !90
  call void %5(i32* %6), !dbg !89
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !92 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !95, metadata !DIExpression()), !dbg !97
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !97
  %1 = load i32*, i32** %data.addr, align 8, !dbg !98
  %2 = bitcast i32* %1 to i8*, !dbg !99
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !99
  %3 = bitcast i32* %arraydecay to i8*, !dbg !99
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !99
  %4 = load i32*, i32** %data.addr, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !100
  %5 = load i32, i32* %arrayidx, align 4, !dbg !100
  call void @printIntLine(i32 %5), !dbg !101
  ret void, !dbg !102
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_44-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_44_bad", scope: !14, file: !14, line: 31, type: !15, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_44-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 33, type: !4)
!18 = !DILocation(line: 33, column: 11, scope: !13)
!19 = !DILocalVariable(name: "funcPtr", scope: !13, file: !14, line: 35, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !4}
!23 = !DILocation(line: 35, column: 12, scope: !13)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 36, type: !4)
!25 = !DILocation(line: 36, column: 11, scope: !13)
!26 = !DILocation(line: 36, column: 34, scope: !13)
!27 = !DILocation(line: 36, column: 27, scope: !13)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 37, type: !4)
!29 = !DILocation(line: 37, column: 11, scope: !13)
!30 = !DILocation(line: 37, column: 35, scope: !13)
!31 = !DILocation(line: 37, column: 28, scope: !13)
!32 = !DILocation(line: 40, column: 12, scope: !13)
!33 = !DILocation(line: 40, column: 10, scope: !13)
!34 = !DILocation(line: 42, column: 5, scope: !13)
!35 = !DILocation(line: 42, column: 13, scope: !13)
!36 = !DILocation(line: 43, column: 1, scope: !13)
!37 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 21, type: !21, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocalVariable(name: "data", arg: 1, scope: !37, file: !14, line: 21, type: !4)
!39 = !DILocation(line: 21, column: 27, scope: !37)
!40 = !DILocalVariable(name: "source", scope: !41, file: !14, line: 24, type: !42)
!41 = distinct !DILexicalBlock(scope: !37, file: !14, line: 23, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 24, column: 13, scope: !41)
!46 = !DILocation(line: 26, column: 17, scope: !41)
!47 = !DILocation(line: 26, column: 9, scope: !41)
!48 = !DILocation(line: 27, column: 22, scope: !41)
!49 = !DILocation(line: 27, column: 9, scope: !41)
!50 = !DILocation(line: 29, column: 1, scope: !37)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_44_good", scope: !14, file: !14, line: 71, type: !15, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 73, column: 5, scope: !51)
!53 = !DILocation(line: 74, column: 1, scope: !51)
!54 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 85, type: !55, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!5, !5, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !14, line: 85, type: !5)
!61 = !DILocation(line: 85, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !14, line: 85, type: !57)
!63 = !DILocation(line: 85, column: 27, scope: !54)
!64 = !DILocation(line: 88, column: 22, scope: !54)
!65 = !DILocation(line: 88, column: 12, scope: !54)
!66 = !DILocation(line: 88, column: 5, scope: !54)
!67 = !DILocation(line: 90, column: 5, scope: !54)
!68 = !DILocation(line: 91, column: 5, scope: !54)
!69 = !DILocation(line: 92, column: 5, scope: !54)
!70 = !DILocation(line: 95, column: 5, scope: !54)
!71 = !DILocation(line: 96, column: 5, scope: !54)
!72 = !DILocation(line: 97, column: 5, scope: !54)
!73 = !DILocation(line: 99, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !14, line: 62, type: !4)
!76 = !DILocation(line: 62, column: 11, scope: !74)
!77 = !DILocalVariable(name: "funcPtr", scope: !74, file: !14, line: 63, type: !20)
!78 = !DILocation(line: 63, column: 12, scope: !74)
!79 = !DILocalVariable(name: "dataBadBuffer", scope: !74, file: !14, line: 64, type: !4)
!80 = !DILocation(line: 64, column: 11, scope: !74)
!81 = !DILocation(line: 64, column: 34, scope: !74)
!82 = !DILocation(line: 64, column: 27, scope: !74)
!83 = !DILocalVariable(name: "dataGoodBuffer", scope: !74, file: !14, line: 65, type: !4)
!84 = !DILocation(line: 65, column: 11, scope: !74)
!85 = !DILocation(line: 65, column: 35, scope: !74)
!86 = !DILocation(line: 65, column: 28, scope: !74)
!87 = !DILocation(line: 67, column: 12, scope: !74)
!88 = !DILocation(line: 67, column: 10, scope: !74)
!89 = !DILocation(line: 68, column: 5, scope: !74)
!90 = !DILocation(line: 68, column: 13, scope: !74)
!91 = !DILocation(line: 69, column: 1, scope: !74)
!92 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 50, type: !21, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", arg: 1, scope: !92, file: !14, line: 50, type: !4)
!94 = !DILocation(line: 50, column: 31, scope: !92)
!95 = !DILocalVariable(name: "source", scope: !96, file: !14, line: 53, type: !42)
!96 = distinct !DILexicalBlock(scope: !92, file: !14, line: 52, column: 5)
!97 = !DILocation(line: 53, column: 13, scope: !96)
!98 = !DILocation(line: 55, column: 17, scope: !96)
!99 = !DILocation(line: 55, column: 9, scope: !96)
!100 = !DILocation(line: 56, column: 22, scope: !96)
!101 = !DILocation(line: 56, column: 9, scope: !96)
!102 = !DILocation(line: 58, column: 1, scope: !92)
