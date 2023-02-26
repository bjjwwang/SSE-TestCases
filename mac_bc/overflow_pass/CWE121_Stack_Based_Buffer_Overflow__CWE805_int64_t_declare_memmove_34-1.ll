; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_34_unionType = type { i64* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !16, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_34_unionType* %myUnion, metadata !22, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i64* %arraydecay, i64** %data, align 8, !dbg !40
  %0 = load i64*, i64** %data, align 8, !dbg !41
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_34_unionType* %myUnion to i64**, !dbg !42
  store i64* %0, i64** %unionFirst, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !44, metadata !DIExpression()), !dbg !46
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_34_unionType* %myUnion to i64**, !dbg !47
  %1 = load i64*, i64** %unionSecond, align 8, !dbg !47
  store i64* %1, i64** %data1, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !48, metadata !DIExpression()), !dbg !50
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !50
  %3 = load i64*, i64** %data1, align 8, !dbg !51
  %4 = bitcast i64* %3 to i8*, !dbg !51
  %arraydecay2 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !51
  %5 = bitcast i64* %arraydecay2 to i8*, !dbg !51
  %6 = load i64*, i64** %data1, align 8, !dbg !51
  %7 = bitcast i64* %6 to i8*, !dbg !51
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !51
  %call = call i8* @__memmove_chk(i8* noundef %4, i8* noundef %5, i64 noundef 800, i64 noundef %8) #5, !dbg !51
  %9 = load i64*, i64** %data1, align 8, !dbg !52
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !52
  %10 = load i64, i64* %arrayidx, align 8, !dbg !52
  call void @printLongLongLine(i64 noundef %10), !dbg !53
  ret void, !dbg !54
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_34_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* noundef null), !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 noundef %conv), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_34_good(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_34_bad(), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_34_unionType* %myUnion, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !88
  store i64* %arraydecay, i64** %data, align 8, !dbg !89
  %0 = load i64*, i64** %data, align 8, !dbg !90
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_34_unionType* %myUnion to i64**, !dbg !91
  store i64* %0, i64** %unionFirst, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !93, metadata !DIExpression()), !dbg !95
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_34_unionType* %myUnion to i64**, !dbg !96
  %1 = load i64*, i64** %unionSecond, align 8, !dbg !96
  store i64* %1, i64** %data1, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !99
  %3 = load i64*, i64** %data1, align 8, !dbg !100
  %4 = bitcast i64* %3 to i8*, !dbg !100
  %arraydecay2 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !100
  %5 = bitcast i64* %arraydecay2 to i8*, !dbg !100
  %6 = load i64*, i64** %data1, align 8, !dbg !100
  %7 = bitcast i64* %6 to i8*, !dbg !100
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !100
  %call = call i8* @__memmove_chk(i8* noundef %4, i8* noundef %5, i64 noundef 800, i64 noundef %8) #5, !dbg !100
  %9 = load i64*, i64** %data1, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !101
  %10 = load i64, i64* %arrayidx, align 8, !dbg !101
  call void @printLongLongLine(i64 noundef %10), !dbg !102
  ret void, !dbg !103
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_34_bad", scope: !12, file: !12, line: 27, type: !13, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 29, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !19, line: 30, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!20 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!21 = !DILocation(line: 29, column: 15, scope: !11)
!22 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 30, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_34_unionType", file: !12, line: 23, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 19, size: 64, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !24, file: !12, line: 21, baseType: !17, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !24, file: !12, line: 22, baseType: !17, size: 64)
!28 = !DILocation(line: 30, column: 85, scope: !11)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 31, column: 13, scope: !11)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 6400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 32, column: 13, scope: !11)
!39 = !DILocation(line: 35, column: 12, scope: !11)
!40 = !DILocation(line: 35, column: 10, scope: !11)
!41 = !DILocation(line: 36, column: 26, scope: !11)
!42 = !DILocation(line: 36, column: 13, scope: !11)
!43 = !DILocation(line: 36, column: 24, scope: !11)
!44 = !DILocalVariable(name: "data", scope: !45, file: !12, line: 38, type: !17)
!45 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!46 = !DILocation(line: 38, column: 19, scope: !45)
!47 = !DILocation(line: 38, column: 34, scope: !45)
!48 = !DILocalVariable(name: "source", scope: !49, file: !12, line: 40, type: !35)
!49 = distinct !DILexicalBlock(scope: !45, file: !12, line: 39, column: 9)
!50 = !DILocation(line: 40, column: 21, scope: !49)
!51 = !DILocation(line: 42, column: 13, scope: !49)
!52 = !DILocation(line: 43, column: 31, scope: !49)
!53 = !DILocation(line: 43, column: 13, scope: !49)
!54 = !DILocation(line: 46, column: 1, scope: !11)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_34_good", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!56 = !DILocation(line: 75, column: 5, scope: !55)
!57 = !DILocation(line: 76, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 87, type: !59, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !61, !62}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !12, line: 87, type: !61)
!66 = !DILocation(line: 87, column: 14, scope: !58)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !12, line: 87, type: !62)
!68 = !DILocation(line: 87, column: 27, scope: !58)
!69 = !DILocation(line: 90, column: 22, scope: !58)
!70 = !DILocation(line: 90, column: 12, scope: !58)
!71 = !DILocation(line: 90, column: 5, scope: !58)
!72 = !DILocation(line: 92, column: 5, scope: !58)
!73 = !DILocation(line: 93, column: 5, scope: !58)
!74 = !DILocation(line: 94, column: 5, scope: !58)
!75 = !DILocation(line: 97, column: 5, scope: !58)
!76 = !DILocation(line: 98, column: 5, scope: !58)
!77 = !DILocation(line: 99, column: 5, scope: !58)
!78 = !DILocation(line: 101, column: 5, scope: !58)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!80 = !DILocalVariable(name: "data", scope: !79, file: !12, line: 55, type: !17)
!81 = !DILocation(line: 55, column: 15, scope: !79)
!82 = !DILocalVariable(name: "myUnion", scope: !79, file: !12, line: 56, type: !23)
!83 = !DILocation(line: 56, column: 85, scope: !79)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !79, file: !12, line: 57, type: !30)
!85 = !DILocation(line: 57, column: 13, scope: !79)
!86 = !DILocalVariable(name: "dataGoodBuffer", scope: !79, file: !12, line: 58, type: !35)
!87 = !DILocation(line: 58, column: 13, scope: !79)
!88 = !DILocation(line: 60, column: 12, scope: !79)
!89 = !DILocation(line: 60, column: 10, scope: !79)
!90 = !DILocation(line: 61, column: 26, scope: !79)
!91 = !DILocation(line: 61, column: 13, scope: !79)
!92 = !DILocation(line: 61, column: 24, scope: !79)
!93 = !DILocalVariable(name: "data", scope: !94, file: !12, line: 63, type: !17)
!94 = distinct !DILexicalBlock(scope: !79, file: !12, line: 62, column: 5)
!95 = !DILocation(line: 63, column: 19, scope: !94)
!96 = !DILocation(line: 63, column: 34, scope: !94)
!97 = !DILocalVariable(name: "source", scope: !98, file: !12, line: 65, type: !35)
!98 = distinct !DILexicalBlock(scope: !94, file: !12, line: 64, column: 9)
!99 = !DILocation(line: 65, column: 21, scope: !98)
!100 = !DILocation(line: 67, column: 13, scope: !98)
!101 = !DILocation(line: 68, column: 31, scope: !98)
!102 = !DILocation(line: 68, column: 13, scope: !98)
!103 = !DILocation(line: 71, column: 1, scope: !79)
