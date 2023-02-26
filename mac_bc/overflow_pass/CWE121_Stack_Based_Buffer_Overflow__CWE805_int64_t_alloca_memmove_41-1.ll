; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_badSink(i64* noundef %data) #0 !dbg !15 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !22, metadata !DIExpression()), !dbg !27
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !27
  %1 = load i64*, i64** %data.addr, align 8, !dbg !28
  %2 = bitcast i64* %1 to i8*, !dbg !28
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !28
  %3 = bitcast i64* %arraydecay to i8*, !dbg !28
  %4 = load i64*, i64** %data.addr, align 8, !dbg !28
  %5 = bitcast i64* %4 to i8*, !dbg !28
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !28
  %call = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 800, i64 noundef %6) #5, !dbg !28
  %7 = load i64*, i64** %data.addr, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !29
  %8 = load i64, i64* %arrayidx, align 8, !dbg !29
  call void @printLongLongLine(i64 noundef %8), !dbg !30
  ret void, !dbg !31
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_bad() #0 !dbg !32 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !37, metadata !DIExpression()), !dbg !38
  %0 = alloca i8, i64 400, align 16, !dbg !39
  %1 = bitcast i8* %0 to i64*, !dbg !40
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !41, metadata !DIExpression()), !dbg !42
  %2 = alloca i8, i64 800, align 16, !dbg !43
  %3 = bitcast i8* %2 to i64*, !dbg !44
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !42
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !45
  store i64* %4, i64** %data, align 8, !dbg !46
  %5 = load i64*, i64** %data, align 8, !dbg !47
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_badSink(i64* noundef %5), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_goodG2BSink(i64* noundef %data) #0 !dbg !50 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !53, metadata !DIExpression()), !dbg !55
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !55
  %1 = load i64*, i64** %data.addr, align 8, !dbg !56
  %2 = bitcast i64* %1 to i8*, !dbg !56
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !56
  %3 = bitcast i64* %arraydecay to i8*, !dbg !56
  %4 = load i64*, i64** %data.addr, align 8, !dbg !56
  %5 = bitcast i64* %4 to i8*, !dbg !56
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !56
  %call = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 800, i64 noundef %6) #5, !dbg !56
  %7 = load i64*, i64** %data.addr, align 8, !dbg !57
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !57
  %8 = load i64, i64* %arrayidx, align 8, !dbg !57
  call void @printLongLongLine(i64 noundef %8), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_good() #0 !dbg !60 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_good(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_bad(), !dbg !81
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
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %0 = alloca i8, i64 400, align 16, !dbg !89
  %1 = bitcast i8* %0 to i64*, !dbg !90
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %2 = alloca i8, i64 800, align 16, !dbg !93
  %3 = bitcast i8* %2 to i64*, !dbg !94
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !92
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !95
  store i64* %4, i64** %data, align 8, !dbg !96
  %5 = load i64*, i64** %data, align 8, !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_goodG2BSink(i64* noundef %5), !dbg !98
  ret void, !dbg !99
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_badSink", scope: !16, file: !16, line: 21, type: !17, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!16 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !3}
!19 = !{}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !15, file: !16, line: 21, type: !3)
!21 = !DILocation(line: 21, column: 93, scope: !15)
!22 = !DILocalVariable(name: "source", scope: !23, file: !16, line: 24, type: !24)
!23 = distinct !DILexicalBlock(scope: !15, file: !16, line: 23, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 24, column: 17, scope: !23)
!28 = !DILocation(line: 26, column: 9, scope: !23)
!29 = !DILocation(line: 27, column: 27, scope: !23)
!30 = !DILocation(line: 27, column: 9, scope: !23)
!31 = !DILocation(line: 29, column: 1, scope: !15)
!32 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_bad", scope: !16, file: !16, line: 31, type: !33, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!33 = !DISubroutineType(types: !34)
!34 = !{null}
!35 = !DILocalVariable(name: "data", scope: !32, file: !16, line: 33, type: !3)
!36 = !DILocation(line: 33, column: 15, scope: !32)
!37 = !DILocalVariable(name: "dataBadBuffer", scope: !32, file: !16, line: 34, type: !3)
!38 = !DILocation(line: 34, column: 15, scope: !32)
!39 = !DILocation(line: 34, column: 42, scope: !32)
!40 = !DILocation(line: 34, column: 31, scope: !32)
!41 = !DILocalVariable(name: "dataGoodBuffer", scope: !32, file: !16, line: 35, type: !3)
!42 = !DILocation(line: 35, column: 15, scope: !32)
!43 = !DILocation(line: 35, column: 43, scope: !32)
!44 = !DILocation(line: 35, column: 32, scope: !32)
!45 = !DILocation(line: 38, column: 12, scope: !32)
!46 = !DILocation(line: 38, column: 10, scope: !32)
!47 = !DILocation(line: 39, column: 82, scope: !32)
!48 = !DILocation(line: 39, column: 5, scope: !32)
!49 = !DILocation(line: 40, column: 1, scope: !32)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_goodG2BSink", scope: !16, file: !16, line: 46, type: !17, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!51 = !DILocalVariable(name: "data", arg: 1, scope: !50, file: !16, line: 46, type: !3)
!52 = !DILocation(line: 46, column: 97, scope: !50)
!53 = !DILocalVariable(name: "source", scope: !54, file: !16, line: 49, type: !24)
!54 = distinct !DILexicalBlock(scope: !50, file: !16, line: 48, column: 5)
!55 = !DILocation(line: 49, column: 17, scope: !54)
!56 = !DILocation(line: 51, column: 9, scope: !54)
!57 = !DILocation(line: 52, column: 27, scope: !54)
!58 = !DILocation(line: 52, column: 9, scope: !54)
!59 = !DILocation(line: 54, column: 1, scope: !50)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_good", scope: !16, file: !16, line: 67, type: !33, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!61 = !DILocation(line: 69, column: 5, scope: !60)
!62 = !DILocation(line: 70, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 82, type: !64, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !16, line: 82, type: !66)
!71 = !DILocation(line: 82, column: 14, scope: !63)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !16, line: 82, type: !67)
!73 = !DILocation(line: 82, column: 27, scope: !63)
!74 = !DILocation(line: 85, column: 22, scope: !63)
!75 = !DILocation(line: 85, column: 12, scope: !63)
!76 = !DILocation(line: 85, column: 5, scope: !63)
!77 = !DILocation(line: 87, column: 5, scope: !63)
!78 = !DILocation(line: 88, column: 5, scope: !63)
!79 = !DILocation(line: 89, column: 5, scope: !63)
!80 = !DILocation(line: 92, column: 5, scope: !63)
!81 = !DILocation(line: 93, column: 5, scope: !63)
!82 = !DILocation(line: 94, column: 5, scope: !63)
!83 = !DILocation(line: 96, column: 5, scope: !63)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 57, type: !33, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!85 = !DILocalVariable(name: "data", scope: !84, file: !16, line: 59, type: !3)
!86 = !DILocation(line: 59, column: 15, scope: !84)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !84, file: !16, line: 60, type: !3)
!88 = !DILocation(line: 60, column: 15, scope: !84)
!89 = !DILocation(line: 60, column: 42, scope: !84)
!90 = !DILocation(line: 60, column: 31, scope: !84)
!91 = !DILocalVariable(name: "dataGoodBuffer", scope: !84, file: !16, line: 61, type: !3)
!92 = !DILocation(line: 61, column: 15, scope: !84)
!93 = !DILocation(line: 61, column: 43, scope: !84)
!94 = !DILocation(line: 61, column: 32, scope: !84)
!95 = !DILocation(line: 63, column: 12, scope: !84)
!96 = !DILocation(line: 63, column: 10, scope: !84)
!97 = !DILocation(line: 64, column: 86, scope: !84)
!98 = !DILocation(line: 64, column: 5, scope: !84)
!99 = !DILocation(line: 65, column: 1, scope: !84)
