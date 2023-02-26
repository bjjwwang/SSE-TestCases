; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_15_bad() #0 !dbg !15 {
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
  store i64* %4, i64** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !37
  %6 = load i64*, i64** %data, align 8, !dbg !38
  %7 = bitcast i64* %6 to i8*, !dbg !38
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !38
  %8 = bitcast i64* %arraydecay to i8*, !dbg !38
  %9 = load i64*, i64** %data, align 8, !dbg !38
  %10 = bitcast i64* %9 to i8*, !dbg !38
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !38
  %call = call i8* @__memcpy_chk(i8* noundef %7, i8* noundef %8, i64 noundef 800, i64 noundef %11) #5, !dbg !38
  %12 = load i64*, i64** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i64, i64* %12, i64 0, !dbg !39
  %13 = load i64, i64* %arrayidx, align 8, !dbg !39
  call void @printLongLongLine(i64 noundef %13), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLongLongLine(i64 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_15_good() #0 !dbg !42 {
entry:
  call void @goodG2B1(), !dbg !43
  call void @goodG2B2(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* noundef null), !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 noundef %conv), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_15_good(), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_15_bad(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !67 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = alloca i8, i64 400, align 16, !dbg !72
  %1 = bitcast i8* %0 to i64*, !dbg !73
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %2 = alloca i8, i64 800, align 16, !dbg !76
  %3 = bitcast i8* %2 to i64*, !dbg !77
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !75
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !78
  store i64* %4, i64** %data, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !80, metadata !DIExpression()), !dbg !82
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !82
  %6 = load i64*, i64** %data, align 8, !dbg !83
  %7 = bitcast i64* %6 to i8*, !dbg !83
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !83
  %8 = bitcast i64* %arraydecay to i8*, !dbg !83
  %9 = load i64*, i64** %data, align 8, !dbg !83
  %10 = bitcast i64* %9 to i8*, !dbg !83
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !83
  %call = call i8* @__memcpy_chk(i8* noundef %7, i8* noundef %8, i64 noundef 800, i64 noundef %11) #5, !dbg !83
  %12 = load i64*, i64** %data, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i64, i64* %12, i64 0, !dbg !84
  %13 = load i64, i64* %arrayidx, align 8, !dbg !84
  call void @printLongLongLine(i64 noundef %13), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !87 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %0 = alloca i8, i64 400, align 16, !dbg !92
  %1 = bitcast i8* %0 to i64*, !dbg !93
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %2 = alloca i8, i64 800, align 16, !dbg !96
  %3 = bitcast i8* %2 to i64*, !dbg !97
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !95
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !98
  store i64* %4, i64** %data, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !102
  %6 = load i64*, i64** %data, align 8, !dbg !103
  %7 = bitcast i64* %6 to i8*, !dbg !103
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !103
  %8 = bitcast i64* %arraydecay to i8*, !dbg !103
  %9 = load i64*, i64** %data, align 8, !dbg !103
  %10 = bitcast i64* %9 to i8*, !dbg !103
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !103
  %call = call i8* @__memcpy_chk(i8* noundef %7, i8* noundef %8, i64 noundef 800, i64 noundef %11) #5, !dbg !103
  %12 = load i64*, i64** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i64, i64* %12, i64 0, !dbg !104
  %13 = load i64, i64* %arrayidx, align 8, !dbg !104
  call void @printLongLongLine(i64 noundef %13), !dbg !105
  ret void, !dbg !106
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_15_bad", scope: !16, file: !16, line: 21, type: !17, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!16 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 23, type: !3)
!21 = !DILocation(line: 23, column: 15, scope: !15)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 24, type: !3)
!23 = !DILocation(line: 24, column: 15, scope: !15)
!24 = !DILocation(line: 24, column: 42, scope: !15)
!25 = !DILocation(line: 24, column: 31, scope: !15)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 25, type: !3)
!27 = !DILocation(line: 25, column: 15, scope: !15)
!28 = !DILocation(line: 25, column: 43, scope: !15)
!29 = !DILocation(line: 25, column: 32, scope: !15)
!30 = !DILocation(line: 31, column: 16, scope: !15)
!31 = !DILocation(line: 31, column: 14, scope: !15)
!32 = !DILocalVariable(name: "source", scope: !33, file: !16, line: 39, type: !34)
!33 = distinct !DILexicalBlock(scope: !15, file: !16, line: 38, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 39, column: 17, scope: !33)
!38 = !DILocation(line: 41, column: 9, scope: !33)
!39 = !DILocation(line: 42, column: 27, scope: !33)
!40 = !DILocation(line: 42, column: 9, scope: !33)
!41 = !DILocation(line: 44, column: 1, scope: !15)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_15_good", scope: !16, file: !16, line: 100, type: !17, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!43 = !DILocation(line: 102, column: 5, scope: !42)
!44 = !DILocation(line: 103, column: 5, scope: !42)
!45 = !DILocation(line: 104, column: 1, scope: !42)
!46 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 116, type: !47, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49, !50}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !16, line: 116, type: !49)
!54 = !DILocation(line: 116, column: 14, scope: !46)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !16, line: 116, type: !50)
!56 = !DILocation(line: 116, column: 27, scope: !46)
!57 = !DILocation(line: 119, column: 22, scope: !46)
!58 = !DILocation(line: 119, column: 12, scope: !46)
!59 = !DILocation(line: 119, column: 5, scope: !46)
!60 = !DILocation(line: 121, column: 5, scope: !46)
!61 = !DILocation(line: 122, column: 5, scope: !46)
!62 = !DILocation(line: 123, column: 5, scope: !46)
!63 = !DILocation(line: 126, column: 5, scope: !46)
!64 = !DILocation(line: 127, column: 5, scope: !46)
!65 = !DILocation(line: 128, column: 5, scope: !46)
!66 = !DILocation(line: 130, column: 5, scope: !46)
!67 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 51, type: !17, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!68 = !DILocalVariable(name: "data", scope: !67, file: !16, line: 53, type: !3)
!69 = !DILocation(line: 53, column: 15, scope: !67)
!70 = !DILocalVariable(name: "dataBadBuffer", scope: !67, file: !16, line: 54, type: !3)
!71 = !DILocation(line: 54, column: 15, scope: !67)
!72 = !DILocation(line: 54, column: 42, scope: !67)
!73 = !DILocation(line: 54, column: 31, scope: !67)
!74 = !DILocalVariable(name: "dataGoodBuffer", scope: !67, file: !16, line: 55, type: !3)
!75 = !DILocation(line: 55, column: 15, scope: !67)
!76 = !DILocation(line: 55, column: 43, scope: !67)
!77 = !DILocation(line: 55, column: 32, scope: !67)
!78 = !DILocation(line: 64, column: 16, scope: !67)
!79 = !DILocation(line: 64, column: 14, scope: !67)
!80 = !DILocalVariable(name: "source", scope: !81, file: !16, line: 68, type: !34)
!81 = distinct !DILexicalBlock(scope: !67, file: !16, line: 67, column: 5)
!82 = !DILocation(line: 68, column: 17, scope: !81)
!83 = !DILocation(line: 70, column: 9, scope: !81)
!84 = !DILocation(line: 71, column: 27, scope: !81)
!85 = !DILocation(line: 71, column: 9, scope: !81)
!86 = !DILocation(line: 73, column: 1, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 76, type: !17, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!88 = !DILocalVariable(name: "data", scope: !87, file: !16, line: 78, type: !3)
!89 = !DILocation(line: 78, column: 15, scope: !87)
!90 = !DILocalVariable(name: "dataBadBuffer", scope: !87, file: !16, line: 79, type: !3)
!91 = !DILocation(line: 79, column: 15, scope: !87)
!92 = !DILocation(line: 79, column: 42, scope: !87)
!93 = !DILocation(line: 79, column: 31, scope: !87)
!94 = !DILocalVariable(name: "dataGoodBuffer", scope: !87, file: !16, line: 80, type: !3)
!95 = !DILocation(line: 80, column: 15, scope: !87)
!96 = !DILocation(line: 80, column: 43, scope: !87)
!97 = !DILocation(line: 80, column: 32, scope: !87)
!98 = !DILocation(line: 85, column: 16, scope: !87)
!99 = !DILocation(line: 85, column: 14, scope: !87)
!100 = !DILocalVariable(name: "source", scope: !101, file: !16, line: 93, type: !34)
!101 = distinct !DILexicalBlock(scope: !87, file: !16, line: 92, column: 5)
!102 = !DILocation(line: 93, column: 17, scope: !101)
!103 = !DILocation(line: 95, column: 9, scope: !101)
!104 = !DILocation(line: 96, column: 27, scope: !101)
!105 = !DILocation(line: 96, column: 9, scope: !101)
!106 = !DILocation(line: 98, column: 1, scope: !87)
