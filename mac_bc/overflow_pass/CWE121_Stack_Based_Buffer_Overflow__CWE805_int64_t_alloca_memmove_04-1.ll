; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_04-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_04_bad() #0 !dbg !15 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 400, align 16, !dbg !24
  %1 = bitcast i8* %0 to i64*, !dbg !25
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %2 = alloca i8, i64 800, align 16, !dbg !28
  %3 = bitcast i8* %2 to i64*, !dbg !29
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !27
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !30
  store i64* %4, i64** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !39
  %6 = load i64*, i64** %data, align 8, !dbg !40
  %7 = bitcast i64* %6 to i8*, !dbg !40
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !40
  %8 = bitcast i64* %arraydecay to i8*, !dbg !40
  %9 = load i64*, i64** %data, align 8, !dbg !40
  %10 = bitcast i64* %9 to i8*, !dbg !40
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !40
  %call = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %8, i64 noundef 800, i64 noundef %11) #5, !dbg !40
  %12 = load i64*, i64** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i64, i64* %12, i64 0, !dbg !41
  %13 = load i64, i64* %arrayidx, align 8, !dbg !41
  call void @printLongLongLine(i64 noundef %13), !dbg !42
  ret void, !dbg !43
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_04_good() #0 !dbg !44 {
entry:
  call void @goodG2B1(), !dbg !45
  call void @goodG2B2(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* noundef null), !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 noundef %conv), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_04_good(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_04_bad(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = alloca i8, i64 400, align 16, !dbg !74
  %1 = bitcast i8* %0 to i64*, !dbg !75
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %2 = alloca i8, i64 800, align 16, !dbg !78
  %3 = bitcast i8* %2 to i64*, !dbg !79
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !77
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !80
  store i64* %4, i64** %data, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !84, metadata !DIExpression()), !dbg !86
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !86
  %6 = load i64*, i64** %data, align 8, !dbg !87
  %7 = bitcast i64* %6 to i8*, !dbg !87
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !87
  %8 = bitcast i64* %arraydecay to i8*, !dbg !87
  %9 = load i64*, i64** %data, align 8, !dbg !87
  %10 = bitcast i64* %9 to i8*, !dbg !87
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !87
  %call = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %8, i64 noundef 800, i64 noundef %11) #5, !dbg !87
  %12 = load i64*, i64** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i64, i64* %12, i64 0, !dbg !88
  %13 = load i64, i64* %arrayidx, align 8, !dbg !88
  call void @printLongLongLine(i64 noundef %13), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !91 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %0 = alloca i8, i64 400, align 16, !dbg !96
  %1 = bitcast i8* %0 to i64*, !dbg !97
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %2 = alloca i8, i64 800, align 16, !dbg !100
  %3 = bitcast i8* %2 to i64*, !dbg !101
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !99
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !102
  store i64* %4, i64** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !108
  %6 = load i64*, i64** %data, align 8, !dbg !109
  %7 = bitcast i64* %6 to i8*, !dbg !109
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !109
  %8 = bitcast i64* %arraydecay to i8*, !dbg !109
  %9 = load i64*, i64** %data, align 8, !dbg !109
  %10 = bitcast i64* %9 to i8*, !dbg !109
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !109
  %call = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %8, i64 noundef 800, i64 noundef %11) #5, !dbg !109
  %12 = load i64*, i64** %data, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i64, i64* %12, i64 0, !dbg !110
  %13 = load i64, i64* %arrayidx, align 8, !dbg !110
  call void @printLongLongLine(i64 noundef %13), !dbg !111
  ret void, !dbg !112
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_04_bad", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!16 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 30, type: !3)
!21 = !DILocation(line: 30, column: 15, scope: !15)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 31, type: !3)
!23 = !DILocation(line: 31, column: 15, scope: !15)
!24 = !DILocation(line: 31, column: 42, scope: !15)
!25 = !DILocation(line: 31, column: 31, scope: !15)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 32, type: !3)
!27 = !DILocation(line: 32, column: 15, scope: !15)
!28 = !DILocation(line: 32, column: 43, scope: !15)
!29 = !DILocation(line: 32, column: 32, scope: !15)
!30 = !DILocation(line: 37, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !16, line: 34, column: 5)
!32 = distinct !DILexicalBlock(scope: !15, file: !16, line: 33, column: 8)
!33 = !DILocation(line: 37, column: 14, scope: !31)
!34 = !DILocalVariable(name: "source", scope: !35, file: !16, line: 40, type: !36)
!35 = distinct !DILexicalBlock(scope: !15, file: !16, line: 39, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 40, column: 17, scope: !35)
!40 = !DILocation(line: 42, column: 9, scope: !35)
!41 = !DILocation(line: 43, column: 27, scope: !35)
!42 = !DILocation(line: 43, column: 9, scope: !35)
!43 = !DILocation(line: 45, column: 1, scope: !15)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_04_good", scope: !16, file: !16, line: 94, type: !17, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!45 = !DILocation(line: 96, column: 5, scope: !44)
!46 = !DILocation(line: 97, column: 5, scope: !44)
!47 = !DILocation(line: 98, column: 1, scope: !44)
!48 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 110, type: !49, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !51, !52}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !16, line: 110, type: !51)
!56 = !DILocation(line: 110, column: 14, scope: !48)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !16, line: 110, type: !52)
!58 = !DILocation(line: 110, column: 27, scope: !48)
!59 = !DILocation(line: 113, column: 22, scope: !48)
!60 = !DILocation(line: 113, column: 12, scope: !48)
!61 = !DILocation(line: 113, column: 5, scope: !48)
!62 = !DILocation(line: 115, column: 5, scope: !48)
!63 = !DILocation(line: 116, column: 5, scope: !48)
!64 = !DILocation(line: 117, column: 5, scope: !48)
!65 = !DILocation(line: 120, column: 5, scope: !48)
!66 = !DILocation(line: 121, column: 5, scope: !48)
!67 = !DILocation(line: 122, column: 5, scope: !48)
!68 = !DILocation(line: 124, column: 5, scope: !48)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 52, type: !17, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!70 = !DILocalVariable(name: "data", scope: !69, file: !16, line: 54, type: !3)
!71 = !DILocation(line: 54, column: 15, scope: !69)
!72 = !DILocalVariable(name: "dataBadBuffer", scope: !69, file: !16, line: 55, type: !3)
!73 = !DILocation(line: 55, column: 15, scope: !69)
!74 = !DILocation(line: 55, column: 42, scope: !69)
!75 = !DILocation(line: 55, column: 31, scope: !69)
!76 = !DILocalVariable(name: "dataGoodBuffer", scope: !69, file: !16, line: 56, type: !3)
!77 = !DILocation(line: 56, column: 15, scope: !69)
!78 = !DILocation(line: 56, column: 43, scope: !69)
!79 = !DILocation(line: 56, column: 32, scope: !69)
!80 = !DILocation(line: 65, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !82, file: !16, line: 63, column: 5)
!82 = distinct !DILexicalBlock(scope: !69, file: !16, line: 57, column: 8)
!83 = !DILocation(line: 65, column: 14, scope: !81)
!84 = !DILocalVariable(name: "source", scope: !85, file: !16, line: 68, type: !36)
!85 = distinct !DILexicalBlock(scope: !69, file: !16, line: 67, column: 5)
!86 = !DILocation(line: 68, column: 17, scope: !85)
!87 = !DILocation(line: 70, column: 9, scope: !85)
!88 = !DILocation(line: 71, column: 27, scope: !85)
!89 = !DILocation(line: 71, column: 9, scope: !85)
!90 = !DILocation(line: 73, column: 1, scope: !69)
!91 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 76, type: !17, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!92 = !DILocalVariable(name: "data", scope: !91, file: !16, line: 78, type: !3)
!93 = !DILocation(line: 78, column: 15, scope: !91)
!94 = !DILocalVariable(name: "dataBadBuffer", scope: !91, file: !16, line: 79, type: !3)
!95 = !DILocation(line: 79, column: 15, scope: !91)
!96 = !DILocation(line: 79, column: 42, scope: !91)
!97 = !DILocation(line: 79, column: 31, scope: !91)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !91, file: !16, line: 80, type: !3)
!99 = !DILocation(line: 80, column: 15, scope: !91)
!100 = !DILocation(line: 80, column: 43, scope: !91)
!101 = !DILocation(line: 80, column: 32, scope: !91)
!102 = !DILocation(line: 84, column: 16, scope: !103)
!103 = distinct !DILexicalBlock(scope: !104, file: !16, line: 82, column: 5)
!104 = distinct !DILexicalBlock(scope: !91, file: !16, line: 81, column: 8)
!105 = !DILocation(line: 84, column: 14, scope: !103)
!106 = !DILocalVariable(name: "source", scope: !107, file: !16, line: 87, type: !36)
!107 = distinct !DILexicalBlock(scope: !91, file: !16, line: 86, column: 5)
!108 = !DILocation(line: 87, column: 17, scope: !107)
!109 = !DILocation(line: 89, column: 9, scope: !107)
!110 = !DILocation(line: 90, column: 27, scope: !107)
!111 = !DILocation(line: 90, column: 9, scope: !107)
!112 = !DILocation(line: 92, column: 1, scope: !91)
