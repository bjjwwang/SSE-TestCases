; ModuleID = 'linux_bc/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_32-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_32-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_32_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %data3 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 50, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !31
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !35
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !36
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !36
  store i8 0, i8* %arrayidx1, align 1, !dbg !37
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !38, metadata !DIExpression()), !dbg !40
  %6 = load i8**, i8*** %dataPtr1, align 8, !dbg !41
  %7 = load i8*, i8** %6, align 8, !dbg !42
  store i8* %7, i8** %data2, align 8, !dbg !40
  %8 = load i8*, i8** %dataBadBuffer, align 8, !dbg !43
  store i8* %8, i8** %data2, align 8, !dbg !44
  %9 = load i8*, i8** %data2, align 8, !dbg !45
  %10 = load i8**, i8*** %dataPtr1, align 8, !dbg !46
  store i8* %9, i8** %10, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !48, metadata !DIExpression()), !dbg !50
  %11 = load i8**, i8*** %dataPtr2, align 8, !dbg !51
  %12 = load i8*, i8** %11, align 8, !dbg !52
  store i8* %12, i8** %data3, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !53, metadata !DIExpression()), !dbg !58
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !59
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !60
  store i8 0, i8* %arrayidx4, align 1, !dbg !61
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !62
  %13 = load i8*, i8** %data3, align 8, !dbg !63
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !64
  %call = call i64 @strlen(i8* %arraydecay6) #7, !dbg !65
  %mul = mul i64 %call, 1, !dbg !66
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay5, i8* align 1 %13, i64 %mul, i1 false), !dbg !62
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !67
  store i8 0, i8* %arrayidx7, align 1, !dbg !68
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !69
  call void @printLine(i8* %arraydecay8), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_32_good() #0 !dbg !72 {
entry:
  call void @goodG2B(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #8, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #8, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_32_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_32_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %data3 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = alloca i8, i64 50, align 16, !dbg !102
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %1 = alloca i8, i64 100, align 16, !dbg !105
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !104
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !107
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !111
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !112
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !112
  store i8 0, i8* %arrayidx1, align 1, !dbg !113
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !114, metadata !DIExpression()), !dbg !116
  %6 = load i8**, i8*** %dataPtr1, align 8, !dbg !117
  %7 = load i8*, i8** %6, align 8, !dbg !118
  store i8* %7, i8** %data2, align 8, !dbg !116
  %8 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !119
  store i8* %8, i8** %data2, align 8, !dbg !120
  %9 = load i8*, i8** %data2, align 8, !dbg !121
  %10 = load i8**, i8*** %dataPtr1, align 8, !dbg !122
  store i8* %9, i8** %10, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !124, metadata !DIExpression()), !dbg !126
  %11 = load i8**, i8*** %dataPtr2, align 8, !dbg !127
  %12 = load i8*, i8** %11, align 8, !dbg !128
  store i8* %12, i8** %data3, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !129, metadata !DIExpression()), !dbg !131
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !132
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !133
  store i8 0, i8* %arrayidx4, align 1, !dbg !134
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !135
  %13 = load i8*, i8** %data3, align 8, !dbg !136
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !137
  %call = call i64 @strlen(i8* %arraydecay6) #7, !dbg !138
  %mul = mul i64 %call, 1, !dbg !139
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay5, i8* align 1 %13, i64 %mul, i1 false), !dbg !135
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !140
  store i8 0, i8* %arrayidx7, align 1, !dbg !141
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !142
  call void @printLine(i8* %arraydecay8), !dbg !143
  ret void, !dbg !144
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_32-1.c", directory: "/home/SVF-tools/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_32_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_32-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataPtr1", scope: !13, file: !14, line: 26, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!21 = !DILocation(line: 26, column: 13, scope: !13)
!22 = !DILocalVariable(name: "dataPtr2", scope: !13, file: !14, line: 27, type: !20)
!23 = !DILocation(line: 27, column: 13, scope: !13)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 28, type: !4)
!25 = !DILocation(line: 28, column: 12, scope: !13)
!26 = !DILocation(line: 28, column: 36, scope: !13)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 29, type: !4)
!28 = !DILocation(line: 29, column: 12, scope: !13)
!29 = !DILocation(line: 29, column: 37, scope: !13)
!30 = !DILocation(line: 30, column: 12, scope: !13)
!31 = !DILocation(line: 30, column: 5, scope: !13)
!32 = !DILocation(line: 31, column: 5, scope: !13)
!33 = !DILocation(line: 31, column: 25, scope: !13)
!34 = !DILocation(line: 32, column: 12, scope: !13)
!35 = !DILocation(line: 32, column: 5, scope: !13)
!36 = !DILocation(line: 33, column: 5, scope: !13)
!37 = !DILocation(line: 33, column: 27, scope: !13)
!38 = !DILocalVariable(name: "data", scope: !39, file: !14, line: 35, type: !4)
!39 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!40 = !DILocation(line: 35, column: 16, scope: !39)
!41 = !DILocation(line: 35, column: 24, scope: !39)
!42 = !DILocation(line: 35, column: 23, scope: !39)
!43 = !DILocation(line: 37, column: 16, scope: !39)
!44 = !DILocation(line: 37, column: 14, scope: !39)
!45 = !DILocation(line: 38, column: 21, scope: !39)
!46 = !DILocation(line: 38, column: 10, scope: !39)
!47 = !DILocation(line: 38, column: 19, scope: !39)
!48 = !DILocalVariable(name: "data", scope: !49, file: !14, line: 41, type: !4)
!49 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!50 = !DILocation(line: 41, column: 16, scope: !49)
!51 = !DILocation(line: 41, column: 24, scope: !49)
!52 = !DILocation(line: 41, column: 23, scope: !49)
!53 = !DILocalVariable(name: "dest", scope: !54, file: !14, line: 43, type: !55)
!54 = distinct !DILexicalBlock(scope: !49, file: !14, line: 42, column: 9)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 100)
!58 = !DILocation(line: 43, column: 18, scope: !54)
!59 = !DILocation(line: 44, column: 13, scope: !54)
!60 = !DILocation(line: 45, column: 13, scope: !54)
!61 = !DILocation(line: 45, column: 25, scope: !54)
!62 = !DILocation(line: 48, column: 13, scope: !54)
!63 = !DILocation(line: 48, column: 26, scope: !54)
!64 = !DILocation(line: 48, column: 39, scope: !54)
!65 = !DILocation(line: 48, column: 32, scope: !54)
!66 = !DILocation(line: 48, column: 44, scope: !54)
!67 = !DILocation(line: 49, column: 13, scope: !54)
!68 = !DILocation(line: 49, column: 25, scope: !54)
!69 = !DILocation(line: 50, column: 23, scope: !54)
!70 = !DILocation(line: 50, column: 13, scope: !54)
!71 = !DILocation(line: 53, column: 1, scope: !13)
!72 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_32_good", scope: !14, file: !14, line: 92, type: !15, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 94, column: 5, scope: !72)
!74 = !DILocation(line: 95, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 106, type: !76, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!78, !78, !20}
!78 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !14, line: 106, type: !78)
!80 = !DILocation(line: 106, column: 14, scope: !75)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !14, line: 106, type: !20)
!82 = !DILocation(line: 106, column: 27, scope: !75)
!83 = !DILocation(line: 109, column: 22, scope: !75)
!84 = !DILocation(line: 109, column: 12, scope: !75)
!85 = !DILocation(line: 109, column: 5, scope: !75)
!86 = !DILocation(line: 111, column: 5, scope: !75)
!87 = !DILocation(line: 112, column: 5, scope: !75)
!88 = !DILocation(line: 113, column: 5, scope: !75)
!89 = !DILocation(line: 116, column: 5, scope: !75)
!90 = !DILocation(line: 117, column: 5, scope: !75)
!91 = !DILocation(line: 118, column: 5, scope: !75)
!92 = !DILocation(line: 120, column: 5, scope: !75)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !14, line: 62, type: !4)
!95 = !DILocation(line: 62, column: 12, scope: !93)
!96 = !DILocalVariable(name: "dataPtr1", scope: !93, file: !14, line: 63, type: !20)
!97 = !DILocation(line: 63, column: 13, scope: !93)
!98 = !DILocalVariable(name: "dataPtr2", scope: !93, file: !14, line: 64, type: !20)
!99 = !DILocation(line: 64, column: 13, scope: !93)
!100 = !DILocalVariable(name: "dataBadBuffer", scope: !93, file: !14, line: 65, type: !4)
!101 = !DILocation(line: 65, column: 12, scope: !93)
!102 = !DILocation(line: 65, column: 36, scope: !93)
!103 = !DILocalVariable(name: "dataGoodBuffer", scope: !93, file: !14, line: 66, type: !4)
!104 = !DILocation(line: 66, column: 12, scope: !93)
!105 = !DILocation(line: 66, column: 37, scope: !93)
!106 = !DILocation(line: 67, column: 12, scope: !93)
!107 = !DILocation(line: 67, column: 5, scope: !93)
!108 = !DILocation(line: 68, column: 5, scope: !93)
!109 = !DILocation(line: 68, column: 25, scope: !93)
!110 = !DILocation(line: 69, column: 12, scope: !93)
!111 = !DILocation(line: 69, column: 5, scope: !93)
!112 = !DILocation(line: 70, column: 5, scope: !93)
!113 = !DILocation(line: 70, column: 27, scope: !93)
!114 = !DILocalVariable(name: "data", scope: !115, file: !14, line: 72, type: !4)
!115 = distinct !DILexicalBlock(scope: !93, file: !14, line: 71, column: 5)
!116 = !DILocation(line: 72, column: 16, scope: !115)
!117 = !DILocation(line: 72, column: 24, scope: !115)
!118 = !DILocation(line: 72, column: 23, scope: !115)
!119 = !DILocation(line: 74, column: 16, scope: !115)
!120 = !DILocation(line: 74, column: 14, scope: !115)
!121 = !DILocation(line: 75, column: 21, scope: !115)
!122 = !DILocation(line: 75, column: 10, scope: !115)
!123 = !DILocation(line: 75, column: 19, scope: !115)
!124 = !DILocalVariable(name: "data", scope: !125, file: !14, line: 78, type: !4)
!125 = distinct !DILexicalBlock(scope: !93, file: !14, line: 77, column: 5)
!126 = !DILocation(line: 78, column: 16, scope: !125)
!127 = !DILocation(line: 78, column: 24, scope: !125)
!128 = !DILocation(line: 78, column: 23, scope: !125)
!129 = !DILocalVariable(name: "dest", scope: !130, file: !14, line: 80, type: !55)
!130 = distinct !DILexicalBlock(scope: !125, file: !14, line: 79, column: 9)
!131 = !DILocation(line: 80, column: 18, scope: !130)
!132 = !DILocation(line: 81, column: 13, scope: !130)
!133 = !DILocation(line: 82, column: 13, scope: !130)
!134 = !DILocation(line: 82, column: 25, scope: !130)
!135 = !DILocation(line: 85, column: 13, scope: !130)
!136 = !DILocation(line: 85, column: 26, scope: !130)
!137 = !DILocation(line: 85, column: 39, scope: !130)
!138 = !DILocation(line: 85, column: 32, scope: !130)
!139 = !DILocation(line: 85, column: 44, scope: !130)
!140 = !DILocation(line: 86, column: 13, scope: !130)
!141 = !DILocation(line: 86, column: 25, scope: !130)
!142 = !DILocation(line: 87, column: 23, scope: !130)
!143 = !DILocation(line: 87, column: 13, scope: !130)
!144 = !DILocation(line: 90, column: 1, scope: !93)
