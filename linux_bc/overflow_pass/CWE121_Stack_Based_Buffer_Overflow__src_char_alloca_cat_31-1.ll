; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_31-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_31-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_31_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  %2 = load i8*, i8** %data, align 8, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !25
  %3 = load i8*, i8** %data, align 8, !dbg !26
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !26
  store i8 0, i8* %arrayidx, align 1, !dbg !27
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !28, metadata !DIExpression()), !dbg !30
  %4 = load i8*, i8** %data, align 8, !dbg !31
  store i8* %4, i8** %dataCopy, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !32, metadata !DIExpression()), !dbg !33
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !34
  store i8* %5, i8** %data1, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !40
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !41
  %7 = load i8*, i8** %data1, align 8, !dbg !42
  %call = call i8* @strcat(i8* %arraydecay, i8* %7) #5, !dbg !43
  %8 = load i8*, i8** %data1, align 8, !dbg !44
  call void @printLine(i8* %8), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_31_good() #0 !dbg !47 {
entry:
  call void @goodG2B(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #5, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #5, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_31_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_31_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !69 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = alloca i8, i64 100, align 16, !dbg !74
  store i8* %0, i8** %dataBuffer, align 8, !dbg !73
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !75
  store i8* %1, i8** %data, align 8, !dbg !76
  %2 = load i8*, i8** %data, align 8, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !78
  %3 = load i8*, i8** %data, align 8, !dbg !79
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !79
  store i8 0, i8* %arrayidx, align 1, !dbg !80
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !81, metadata !DIExpression()), !dbg !83
  %4 = load i8*, i8** %data, align 8, !dbg !84
  store i8* %4, i8** %dataCopy, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !85, metadata !DIExpression()), !dbg !86
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !87
  store i8* %5, i8** %data1, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !88, metadata !DIExpression()), !dbg !90
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !90
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !91
  %7 = load i8*, i8** %data1, align 8, !dbg !92
  %call = call i8* @strcat(i8* %arraydecay, i8* %7) #5, !dbg !93
  %8 = load i8*, i8** %data1, align 8, !dbg !94
  call void @printLine(i8* %8), !dbg !95
  ret void, !dbg !96
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_31-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_31_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_31-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 10, scope: !13)
!24 = !DILocation(line: 29, column: 12, scope: !13)
!25 = !DILocation(line: 29, column: 5, scope: !13)
!26 = !DILocation(line: 30, column: 5, scope: !13)
!27 = !DILocation(line: 30, column: 17, scope: !13)
!28 = !DILocalVariable(name: "dataCopy", scope: !29, file: !14, line: 32, type: !4)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!30 = !DILocation(line: 32, column: 16, scope: !29)
!31 = !DILocation(line: 32, column: 27, scope: !29)
!32 = !DILocalVariable(name: "data", scope: !29, file: !14, line: 33, type: !4)
!33 = !DILocation(line: 33, column: 16, scope: !29)
!34 = !DILocation(line: 33, column: 23, scope: !29)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !14, line: 35, type: !37)
!36 = distinct !DILexicalBlock(scope: !29, file: !14, line: 34, column: 9)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 35, column: 18, scope: !36)
!41 = !DILocation(line: 37, column: 20, scope: !36)
!42 = !DILocation(line: 37, column: 26, scope: !36)
!43 = !DILocation(line: 37, column: 13, scope: !36)
!44 = !DILocation(line: 38, column: 23, scope: !36)
!45 = !DILocation(line: 38, column: 13, scope: !36)
!46 = !DILocation(line: 41, column: 1, scope: !13)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_31_good", scope: !14, file: !14, line: 68, type: !15, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 70, column: 5, scope: !47)
!49 = !DILocation(line: 71, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 82, type: !51, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !14, line: 82, type: !53)
!56 = !DILocation(line: 82, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !14, line: 82, type: !54)
!58 = !DILocation(line: 82, column: 27, scope: !50)
!59 = !DILocation(line: 85, column: 22, scope: !50)
!60 = !DILocation(line: 85, column: 12, scope: !50)
!61 = !DILocation(line: 85, column: 5, scope: !50)
!62 = !DILocation(line: 87, column: 5, scope: !50)
!63 = !DILocation(line: 88, column: 5, scope: !50)
!64 = !DILocation(line: 89, column: 5, scope: !50)
!65 = !DILocation(line: 92, column: 5, scope: !50)
!66 = !DILocation(line: 93, column: 5, scope: !50)
!67 = !DILocation(line: 94, column: 5, scope: !50)
!68 = !DILocation(line: 96, column: 5, scope: !50)
!69 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 48, type: !15, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !14, line: 50, type: !4)
!71 = !DILocation(line: 50, column: 12, scope: !69)
!72 = !DILocalVariable(name: "dataBuffer", scope: !69, file: !14, line: 51, type: !4)
!73 = !DILocation(line: 51, column: 12, scope: !69)
!74 = !DILocation(line: 51, column: 33, scope: !69)
!75 = !DILocation(line: 52, column: 12, scope: !69)
!76 = !DILocation(line: 52, column: 10, scope: !69)
!77 = !DILocation(line: 54, column: 12, scope: !69)
!78 = !DILocation(line: 54, column: 5, scope: !69)
!79 = !DILocation(line: 55, column: 5, scope: !69)
!80 = !DILocation(line: 55, column: 16, scope: !69)
!81 = !DILocalVariable(name: "dataCopy", scope: !82, file: !14, line: 57, type: !4)
!82 = distinct !DILexicalBlock(scope: !69, file: !14, line: 56, column: 5)
!83 = !DILocation(line: 57, column: 16, scope: !82)
!84 = !DILocation(line: 57, column: 27, scope: !82)
!85 = !DILocalVariable(name: "data", scope: !82, file: !14, line: 58, type: !4)
!86 = !DILocation(line: 58, column: 16, scope: !82)
!87 = !DILocation(line: 58, column: 23, scope: !82)
!88 = !DILocalVariable(name: "dest", scope: !89, file: !14, line: 60, type: !37)
!89 = distinct !DILexicalBlock(scope: !82, file: !14, line: 59, column: 9)
!90 = !DILocation(line: 60, column: 18, scope: !89)
!91 = !DILocation(line: 62, column: 20, scope: !89)
!92 = !DILocation(line: 62, column: 26, scope: !89)
!93 = !DILocation(line: 62, column: 13, scope: !89)
!94 = !DILocation(line: 63, column: 23, scope: !89)
!95 = !DILocation(line: 63, column: 13, scope: !89)
!96 = !DILocation(line: 66, column: 1, scope: !69)
