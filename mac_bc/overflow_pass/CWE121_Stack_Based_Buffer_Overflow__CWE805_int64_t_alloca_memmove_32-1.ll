; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_32_bad() #0 !dbg !15 {
entry:
  %data = alloca i64*, align 8
  %dataPtr1 = alloca i64**, align 8
  %dataPtr2 = alloca i64**, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %data2 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i64*** %dataPtr1, metadata !22, metadata !DIExpression()), !dbg !24
  store i64** %data, i64*** %dataPtr1, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i64*** %dataPtr2, metadata !25, metadata !DIExpression()), !dbg !26
  store i64** %data, i64*** %dataPtr2, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 400, align 16, !dbg !29
  %1 = bitcast i8* %0 to i64*, !dbg !30
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !32
  %2 = alloca i8, i64 800, align 16, !dbg !33
  %3 = bitcast i8* %2 to i64*, !dbg !34
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !35, metadata !DIExpression()), !dbg !37
  %4 = load i64**, i64*** %dataPtr1, align 8, !dbg !38
  %5 = load i64*, i64** %4, align 8, !dbg !39
  store i64* %5, i64** %data1, align 8, !dbg !37
  %6 = load i64*, i64** %dataBadBuffer, align 8, !dbg !40
  store i64* %6, i64** %data1, align 8, !dbg !41
  %7 = load i64*, i64** %data1, align 8, !dbg !42
  %8 = load i64**, i64*** %dataPtr1, align 8, !dbg !43
  store i64* %7, i64** %8, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i64** %data2, metadata !45, metadata !DIExpression()), !dbg !47
  %9 = load i64**, i64*** %dataPtr2, align 8, !dbg !48
  %10 = load i64*, i64** %9, align 8, !dbg !49
  store i64* %10, i64** %data2, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !50, metadata !DIExpression()), !dbg !55
  %11 = bitcast [100 x i64]* %source to i8*, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 800, i1 false), !dbg !55
  %12 = load i64*, i64** %data2, align 8, !dbg !56
  %13 = bitcast i64* %12 to i8*, !dbg !56
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !56
  %14 = bitcast i64* %arraydecay to i8*, !dbg !56
  %15 = load i64*, i64** %data2, align 8, !dbg !56
  %16 = bitcast i64* %15 to i8*, !dbg !56
  %17 = call i64 @llvm.objectsize.i64.p0i8(i8* %16, i1 false, i1 true, i1 false), !dbg !56
  %call = call i8* @__memmove_chk(i8* noundef %13, i8* noundef %14, i64 noundef 800, i64 noundef %17) #5, !dbg !56
  %18 = load i64*, i64** %data2, align 8, !dbg !57
  %arrayidx = getelementptr inbounds i64, i64* %18, i64 0, !dbg !57
  %19 = load i64, i64* %arrayidx, align 8, !dbg !57
  call void @printLongLongLine(i64 noundef %19), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLongLongLine(i64 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_32_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* noundef null), !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 noundef %conv), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_32_good(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_32_bad(), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i64*, align 8
  %dataPtr1 = alloca i64**, align 8
  %dataPtr2 = alloca i64**, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %data2 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i64*** %dataPtr1, metadata !87, metadata !DIExpression()), !dbg !88
  store i64** %data, i64*** %dataPtr1, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i64*** %dataPtr2, metadata !89, metadata !DIExpression()), !dbg !90
  store i64** %data, i64*** %dataPtr2, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %0 = alloca i8, i64 400, align 16, !dbg !93
  %1 = bitcast i8* %0 to i64*, !dbg !94
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %2 = alloca i8, i64 800, align 16, !dbg !97
  %3 = bitcast i8* %2 to i64*, !dbg !98
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !99, metadata !DIExpression()), !dbg !101
  %4 = load i64**, i64*** %dataPtr1, align 8, !dbg !102
  %5 = load i64*, i64** %4, align 8, !dbg !103
  store i64* %5, i64** %data1, align 8, !dbg !101
  %6 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !104
  store i64* %6, i64** %data1, align 8, !dbg !105
  %7 = load i64*, i64** %data1, align 8, !dbg !106
  %8 = load i64**, i64*** %dataPtr1, align 8, !dbg !107
  store i64* %7, i64** %8, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i64** %data2, metadata !109, metadata !DIExpression()), !dbg !111
  %9 = load i64**, i64*** %dataPtr2, align 8, !dbg !112
  %10 = load i64*, i64** %9, align 8, !dbg !113
  store i64* %10, i64** %data2, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !114, metadata !DIExpression()), !dbg !116
  %11 = bitcast [100 x i64]* %source to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 800, i1 false), !dbg !116
  %12 = load i64*, i64** %data2, align 8, !dbg !117
  %13 = bitcast i64* %12 to i8*, !dbg !117
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !117
  %14 = bitcast i64* %arraydecay to i8*, !dbg !117
  %15 = load i64*, i64** %data2, align 8, !dbg !117
  %16 = bitcast i64* %15 to i8*, !dbg !117
  %17 = call i64 @llvm.objectsize.i64.p0i8(i8* %16, i1 false, i1 true, i1 false), !dbg !117
  %call = call i8* @__memmove_chk(i8* noundef %13, i8* noundef %14, i64 noundef 800, i64 noundef %17) #5, !dbg !117
  %18 = load i64*, i64** %data2, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i64, i64* %18, i64 0, !dbg !118
  %19 = load i64, i64* %arrayidx, align 8, !dbg !118
  call void @printLongLongLine(i64 noundef %19), !dbg !119
  ret void, !dbg !120
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !7}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !5, line: 30, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!6 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"Homebrew clang version 14.0.6"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_32_bad", scope: !16, file: !16, line: 21, type: !17, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!16 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 23, type: !3)
!21 = !DILocation(line: 23, column: 15, scope: !15)
!22 = !DILocalVariable(name: "dataPtr1", scope: !15, file: !16, line: 24, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!24 = !DILocation(line: 24, column: 16, scope: !15)
!25 = !DILocalVariable(name: "dataPtr2", scope: !15, file: !16, line: 25, type: !23)
!26 = !DILocation(line: 25, column: 16, scope: !15)
!27 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 26, type: !3)
!28 = !DILocation(line: 26, column: 15, scope: !15)
!29 = !DILocation(line: 26, column: 42, scope: !15)
!30 = !DILocation(line: 26, column: 31, scope: !15)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 27, type: !3)
!32 = !DILocation(line: 27, column: 15, scope: !15)
!33 = !DILocation(line: 27, column: 43, scope: !15)
!34 = !DILocation(line: 27, column: 32, scope: !15)
!35 = !DILocalVariable(name: "data", scope: !36, file: !16, line: 29, type: !3)
!36 = distinct !DILexicalBlock(scope: !15, file: !16, line: 28, column: 5)
!37 = !DILocation(line: 29, column: 19, scope: !36)
!38 = !DILocation(line: 29, column: 27, scope: !36)
!39 = !DILocation(line: 29, column: 26, scope: !36)
!40 = !DILocation(line: 32, column: 16, scope: !36)
!41 = !DILocation(line: 32, column: 14, scope: !36)
!42 = !DILocation(line: 33, column: 21, scope: !36)
!43 = !DILocation(line: 33, column: 10, scope: !36)
!44 = !DILocation(line: 33, column: 19, scope: !36)
!45 = !DILocalVariable(name: "data", scope: !46, file: !16, line: 36, type: !3)
!46 = distinct !DILexicalBlock(scope: !15, file: !16, line: 35, column: 5)
!47 = !DILocation(line: 36, column: 19, scope: !46)
!48 = !DILocation(line: 36, column: 27, scope: !46)
!49 = !DILocation(line: 36, column: 26, scope: !46)
!50 = !DILocalVariable(name: "source", scope: !51, file: !16, line: 38, type: !52)
!51 = distinct !DILexicalBlock(scope: !46, file: !16, line: 37, column: 9)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 38, column: 21, scope: !51)
!56 = !DILocation(line: 40, column: 13, scope: !51)
!57 = !DILocation(line: 41, column: 31, scope: !51)
!58 = !DILocation(line: 41, column: 13, scope: !51)
!59 = !DILocation(line: 44, column: 1, scope: !15)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_32_good", scope: !16, file: !16, line: 75, type: !17, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!61 = !DILocation(line: 77, column: 5, scope: !60)
!62 = !DILocation(line: 78, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 89, type: !64, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !16, line: 89, type: !66)
!71 = !DILocation(line: 89, column: 14, scope: !63)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !16, line: 89, type: !67)
!73 = !DILocation(line: 89, column: 27, scope: !63)
!74 = !DILocation(line: 92, column: 22, scope: !63)
!75 = !DILocation(line: 92, column: 12, scope: !63)
!76 = !DILocation(line: 92, column: 5, scope: !63)
!77 = !DILocation(line: 94, column: 5, scope: !63)
!78 = !DILocation(line: 95, column: 5, scope: !63)
!79 = !DILocation(line: 96, column: 5, scope: !63)
!80 = !DILocation(line: 99, column: 5, scope: !63)
!81 = !DILocation(line: 100, column: 5, scope: !63)
!82 = !DILocation(line: 101, column: 5, scope: !63)
!83 = !DILocation(line: 103, column: 5, scope: !63)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 51, type: !17, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!85 = !DILocalVariable(name: "data", scope: !84, file: !16, line: 53, type: !3)
!86 = !DILocation(line: 53, column: 15, scope: !84)
!87 = !DILocalVariable(name: "dataPtr1", scope: !84, file: !16, line: 54, type: !23)
!88 = !DILocation(line: 54, column: 16, scope: !84)
!89 = !DILocalVariable(name: "dataPtr2", scope: !84, file: !16, line: 55, type: !23)
!90 = !DILocation(line: 55, column: 16, scope: !84)
!91 = !DILocalVariable(name: "dataBadBuffer", scope: !84, file: !16, line: 56, type: !3)
!92 = !DILocation(line: 56, column: 15, scope: !84)
!93 = !DILocation(line: 56, column: 42, scope: !84)
!94 = !DILocation(line: 56, column: 31, scope: !84)
!95 = !DILocalVariable(name: "dataGoodBuffer", scope: !84, file: !16, line: 57, type: !3)
!96 = !DILocation(line: 57, column: 15, scope: !84)
!97 = !DILocation(line: 57, column: 43, scope: !84)
!98 = !DILocation(line: 57, column: 32, scope: !84)
!99 = !DILocalVariable(name: "data", scope: !100, file: !16, line: 59, type: !3)
!100 = distinct !DILexicalBlock(scope: !84, file: !16, line: 58, column: 5)
!101 = !DILocation(line: 59, column: 19, scope: !100)
!102 = !DILocation(line: 59, column: 27, scope: !100)
!103 = !DILocation(line: 59, column: 26, scope: !100)
!104 = !DILocation(line: 61, column: 16, scope: !100)
!105 = !DILocation(line: 61, column: 14, scope: !100)
!106 = !DILocation(line: 62, column: 21, scope: !100)
!107 = !DILocation(line: 62, column: 10, scope: !100)
!108 = !DILocation(line: 62, column: 19, scope: !100)
!109 = !DILocalVariable(name: "data", scope: !110, file: !16, line: 65, type: !3)
!110 = distinct !DILexicalBlock(scope: !84, file: !16, line: 64, column: 5)
!111 = !DILocation(line: 65, column: 19, scope: !110)
!112 = !DILocation(line: 65, column: 27, scope: !110)
!113 = !DILocation(line: 65, column: 26, scope: !110)
!114 = !DILocalVariable(name: "source", scope: !115, file: !16, line: 67, type: !52)
!115 = distinct !DILexicalBlock(scope: !110, file: !16, line: 66, column: 9)
!116 = !DILocation(line: 67, column: 21, scope: !115)
!117 = !DILocation(line: 69, column: 13, scope: !115)
!118 = !DILocation(line: 70, column: 31, scope: !115)
!119 = !DILocation(line: 70, column: 13, scope: !115)
!120 = !DILocation(line: 73, column: 1, scope: !84)
