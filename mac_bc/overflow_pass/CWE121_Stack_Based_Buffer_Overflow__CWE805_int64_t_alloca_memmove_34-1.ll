; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_34_unionType = type { i64* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_34_bad() #0 !dbg !15 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_34_unionType, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_34_unionType* %myUnion, metadata !22, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = alloca i8, i64 400, align 16, !dbg !31
  %1 = bitcast i8* %0 to i64*, !dbg !32
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !34
  %2 = alloca i8, i64 800, align 16, !dbg !35
  %3 = bitcast i8* %2 to i64*, !dbg !36
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !34
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !37
  store i64* %4, i64** %data, align 8, !dbg !38
  %5 = load i64*, i64** %data, align 8, !dbg !39
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_34_unionType* %myUnion to i64**, !dbg !40
  store i64* %5, i64** %unionFirst, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !42, metadata !DIExpression()), !dbg !44
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_34_unionType* %myUnion to i64**, !dbg !45
  %6 = load i64*, i64** %unionSecond, align 8, !dbg !45
  store i64* %6, i64** %data1, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  %7 = bitcast [100 x i64]* %source to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 800, i1 false), !dbg !51
  %8 = load i64*, i64** %data1, align 8, !dbg !52
  %9 = bitcast i64* %8 to i8*, !dbg !52
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !52
  %10 = bitcast i64* %arraydecay to i8*, !dbg !52
  %11 = load i64*, i64** %data1, align 8, !dbg !52
  %12 = bitcast i64* %11 to i8*, !dbg !52
  %13 = call i64 @llvm.objectsize.i64.p0i8(i8* %12, i1 false, i1 true, i1 false), !dbg !52
  %call = call i8* @__memmove_chk(i8* noundef %9, i8* noundef %10, i64 noundef 800, i64 noundef %13) #5, !dbg !52
  %14 = load i64*, i64** %data1, align 8, !dbg !53
  %arrayidx = getelementptr inbounds i64, i64* %14, i64 0, !dbg !53
  %15 = load i64, i64* %arrayidx, align 8, !dbg !53
  call void @printLongLongLine(i64 noundef %15), !dbg !54
  ret void, !dbg !55
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_34_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* noundef null), !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 noundef %conv), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_34_good(), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_34_bad(), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_34_unionType, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_34_unionType* %myUnion, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %0 = alloca i8, i64 400, align 16, !dbg !87
  %1 = bitcast i8* %0 to i64*, !dbg !88
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %2 = alloca i8, i64 800, align 16, !dbg !91
  %3 = bitcast i8* %2 to i64*, !dbg !92
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !90
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !93
  store i64* %4, i64** %data, align 8, !dbg !94
  %5 = load i64*, i64** %data, align 8, !dbg !95
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_34_unionType* %myUnion to i64**, !dbg !96
  store i64* %5, i64** %unionFirst, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !98, metadata !DIExpression()), !dbg !100
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_34_unionType* %myUnion to i64**, !dbg !101
  %6 = load i64*, i64** %unionSecond, align 8, !dbg !101
  store i64* %6, i64** %data1, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %7 = bitcast [100 x i64]* %source to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 800, i1 false), !dbg !104
  %8 = load i64*, i64** %data1, align 8, !dbg !105
  %9 = bitcast i64* %8 to i8*, !dbg !105
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !105
  %10 = bitcast i64* %arraydecay to i8*, !dbg !105
  %11 = load i64*, i64** %data1, align 8, !dbg !105
  %12 = bitcast i64* %11 to i8*, !dbg !105
  %13 = call i64 @llvm.objectsize.i64.p0i8(i8* %12, i1 false, i1 true, i1 false), !dbg !105
  %call = call i8* @__memmove_chk(i8* noundef %9, i8* noundef %10, i64 noundef 800, i64 noundef %13) #5, !dbg !105
  %14 = load i64*, i64** %data1, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i64, i64* %14, i64 0, !dbg !106
  %15 = load i64, i64* %arrayidx, align 8, !dbg !106
  call void @printLongLongLine(i64 noundef %15), !dbg !107
  ret void, !dbg !108
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_34_bad", scope: !16, file: !16, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!16 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 29, type: !3)
!21 = !DILocation(line: 29, column: 15, scope: !15)
!22 = !DILocalVariable(name: "myUnion", scope: !15, file: !16, line: 30, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_34_unionType", file: !16, line: 23, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !16, line: 19, size: 64, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !24, file: !16, line: 21, baseType: !3, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !24, file: !16, line: 22, baseType: !3, size: 64)
!28 = !DILocation(line: 30, column: 84, scope: !15)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 31, type: !3)
!30 = !DILocation(line: 31, column: 15, scope: !15)
!31 = !DILocation(line: 31, column: 42, scope: !15)
!32 = !DILocation(line: 31, column: 31, scope: !15)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 32, type: !3)
!34 = !DILocation(line: 32, column: 15, scope: !15)
!35 = !DILocation(line: 32, column: 43, scope: !15)
!36 = !DILocation(line: 32, column: 32, scope: !15)
!37 = !DILocation(line: 35, column: 12, scope: !15)
!38 = !DILocation(line: 35, column: 10, scope: !15)
!39 = !DILocation(line: 36, column: 26, scope: !15)
!40 = !DILocation(line: 36, column: 13, scope: !15)
!41 = !DILocation(line: 36, column: 24, scope: !15)
!42 = !DILocalVariable(name: "data", scope: !43, file: !16, line: 38, type: !3)
!43 = distinct !DILexicalBlock(scope: !15, file: !16, line: 37, column: 5)
!44 = !DILocation(line: 38, column: 19, scope: !43)
!45 = !DILocation(line: 38, column: 34, scope: !43)
!46 = !DILocalVariable(name: "source", scope: !47, file: !16, line: 40, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !16, line: 39, column: 9)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 40, column: 21, scope: !47)
!52 = !DILocation(line: 42, column: 13, scope: !47)
!53 = !DILocation(line: 43, column: 31, scope: !47)
!54 = !DILocation(line: 43, column: 13, scope: !47)
!55 = !DILocation(line: 46, column: 1, scope: !15)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_34_good", scope: !16, file: !16, line: 73, type: !17, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!57 = !DILocation(line: 75, column: 5, scope: !56)
!58 = !DILocation(line: 76, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 87, type: !60, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !16, line: 87, type: !62)
!67 = !DILocation(line: 87, column: 14, scope: !59)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !16, line: 87, type: !63)
!69 = !DILocation(line: 87, column: 27, scope: !59)
!70 = !DILocation(line: 90, column: 22, scope: !59)
!71 = !DILocation(line: 90, column: 12, scope: !59)
!72 = !DILocation(line: 90, column: 5, scope: !59)
!73 = !DILocation(line: 92, column: 5, scope: !59)
!74 = !DILocation(line: 93, column: 5, scope: !59)
!75 = !DILocation(line: 94, column: 5, scope: !59)
!76 = !DILocation(line: 97, column: 5, scope: !59)
!77 = !DILocation(line: 98, column: 5, scope: !59)
!78 = !DILocation(line: 99, column: 5, scope: !59)
!79 = !DILocation(line: 101, column: 5, scope: !59)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!81 = !DILocalVariable(name: "data", scope: !80, file: !16, line: 55, type: !3)
!82 = !DILocation(line: 55, column: 15, scope: !80)
!83 = !DILocalVariable(name: "myUnion", scope: !80, file: !16, line: 56, type: !23)
!84 = !DILocation(line: 56, column: 84, scope: !80)
!85 = !DILocalVariable(name: "dataBadBuffer", scope: !80, file: !16, line: 57, type: !3)
!86 = !DILocation(line: 57, column: 15, scope: !80)
!87 = !DILocation(line: 57, column: 42, scope: !80)
!88 = !DILocation(line: 57, column: 31, scope: !80)
!89 = !DILocalVariable(name: "dataGoodBuffer", scope: !80, file: !16, line: 58, type: !3)
!90 = !DILocation(line: 58, column: 15, scope: !80)
!91 = !DILocation(line: 58, column: 43, scope: !80)
!92 = !DILocation(line: 58, column: 32, scope: !80)
!93 = !DILocation(line: 60, column: 12, scope: !80)
!94 = !DILocation(line: 60, column: 10, scope: !80)
!95 = !DILocation(line: 61, column: 26, scope: !80)
!96 = !DILocation(line: 61, column: 13, scope: !80)
!97 = !DILocation(line: 61, column: 24, scope: !80)
!98 = !DILocalVariable(name: "data", scope: !99, file: !16, line: 63, type: !3)
!99 = distinct !DILexicalBlock(scope: !80, file: !16, line: 62, column: 5)
!100 = !DILocation(line: 63, column: 19, scope: !99)
!101 = !DILocation(line: 63, column: 34, scope: !99)
!102 = !DILocalVariable(name: "source", scope: !103, file: !16, line: 65, type: !48)
!103 = distinct !DILexicalBlock(scope: !99, file: !16, line: 64, column: 9)
!104 = !DILocation(line: 65, column: 21, scope: !103)
!105 = !DILocation(line: 67, column: 13, scope: !103)
!106 = !DILocation(line: 68, column: 31, scope: !103)
!107 = !DILocation(line: 68, column: 13, scope: !103)
!108 = !DILocation(line: 71, column: 1, scope: !80)
