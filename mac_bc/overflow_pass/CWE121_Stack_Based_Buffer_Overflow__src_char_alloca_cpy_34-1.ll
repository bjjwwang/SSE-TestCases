; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_34_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_34_unionType, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %0, i8** %dataBuffer, align 8, !dbg !28
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  store i8* %1, i8** %data, align 8, !dbg !31
  %2 = load i8*, i8** %data, align 8, !dbg !32
  %3 = load i8*, i8** %data, align 8, !dbg !32
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !32
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #5, !dbg !32
  %5 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %6 = load i8*, i8** %data, align 8, !dbg !35
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_34_unionType* %myUnion to i8**, !dbg !36
  store i8* %6, i8** %unionFirst, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !38, metadata !DIExpression()), !dbg !40
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_34_unionType* %myUnion to i8**, !dbg !41
  %7 = load i8*, i8** %unionSecond, align 8, !dbg !41
  store i8* %7, i8** %data1, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %8 = bitcast [50 x i8]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 50, i1 false), !dbg !47
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !48
  %9 = load i8*, i8** %data1, align 8, !dbg !48
  %call2 = call i8* @__strcpy_chk(i8* noundef %arraydecay, i8* noundef %9, i64 noundef 50) #5, !dbg !48
  %10 = load i8*, i8** %data1, align 8, !dbg !49
  call void @printLine(i8* noundef %10), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #2

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_34_good() #0 !dbg !52 {
entry:
  call void @goodG2B(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* noundef null), !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 noundef %conv), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_34_good(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_34_bad(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_34_unionType, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_34_unionType* %myUnion, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 100, align 16, !dbg !81
  store i8* %0, i8** %dataBuffer, align 8, !dbg !80
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !82
  store i8* %1, i8** %data, align 8, !dbg !83
  %2 = load i8*, i8** %data, align 8, !dbg !84
  %3 = load i8*, i8** %data, align 8, !dbg !84
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !84
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !84
  %5 = load i8*, i8** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !85
  store i8 0, i8* %arrayidx, align 1, !dbg !86
  %6 = load i8*, i8** %data, align 8, !dbg !87
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_34_unionType* %myUnion to i8**, !dbg !88
  store i8* %6, i8** %unionFirst, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !90, metadata !DIExpression()), !dbg !92
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_34_unionType* %myUnion to i8**, !dbg !93
  %7 = load i8*, i8** %unionSecond, align 8, !dbg !93
  store i8* %7, i8** %data1, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !94, metadata !DIExpression()), !dbg !96
  %8 = bitcast [50 x i8]* %dest to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 50, i1 false), !dbg !96
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !97
  %9 = load i8*, i8** %data1, align 8, !dbg !97
  %call2 = call i8* @__strcpy_chk(i8* noundef %arraydecay, i8* noundef %9, i64 noundef 50) #5, !dbg !97
  %10 = load i8*, i8** %data1, align 8, !dbg !98
  call void @printLine(i8* noundef %10), !dbg !99
  ret void, !dbg !100
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_34_bad", scope: !14, file: !14, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 31, type: !3)
!19 = !DILocation(line: 31, column: 12, scope: !13)
!20 = !DILocalVariable(name: "myUnion", scope: !13, file: !14, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_34_unionType", file: !14, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !14, line: 21, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !14, line: 23, baseType: !3, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !14, line: 24, baseType: !3, size: 64)
!26 = !DILocation(line: 32, column: 74, scope: !13)
!27 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 33, type: !3)
!28 = !DILocation(line: 33, column: 12, scope: !13)
!29 = !DILocation(line: 33, column: 33, scope: !13)
!30 = !DILocation(line: 34, column: 12, scope: !13)
!31 = !DILocation(line: 34, column: 10, scope: !13)
!32 = !DILocation(line: 36, column: 5, scope: !13)
!33 = !DILocation(line: 37, column: 5, scope: !13)
!34 = !DILocation(line: 37, column: 17, scope: !13)
!35 = !DILocation(line: 38, column: 26, scope: !13)
!36 = !DILocation(line: 38, column: 13, scope: !13)
!37 = !DILocation(line: 38, column: 24, scope: !13)
!38 = !DILocalVariable(name: "data", scope: !39, file: !14, line: 40, type: !3)
!39 = distinct !DILexicalBlock(scope: !13, file: !14, line: 39, column: 5)
!40 = !DILocation(line: 40, column: 16, scope: !39)
!41 = !DILocation(line: 40, column: 31, scope: !39)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !14, line: 42, type: !44)
!43 = distinct !DILexicalBlock(scope: !39, file: !14, line: 41, column: 9)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 42, column: 18, scope: !43)
!48 = !DILocation(line: 44, column: 13, scope: !43)
!49 = !DILocation(line: 45, column: 23, scope: !43)
!50 = !DILocation(line: 45, column: 13, scope: !43)
!51 = !DILocation(line: 48, column: 1, scope: !13)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_34_good", scope: !14, file: !14, line: 76, type: !15, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!53 = !DILocation(line: 78, column: 5, scope: !52)
!54 = !DILocation(line: 79, column: 1, scope: !52)
!55 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 90, type: !56, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !14, line: 90, type: !58)
!61 = !DILocation(line: 90, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !14, line: 90, type: !59)
!63 = !DILocation(line: 90, column: 27, scope: !55)
!64 = !DILocation(line: 93, column: 22, scope: !55)
!65 = !DILocation(line: 93, column: 12, scope: !55)
!66 = !DILocation(line: 93, column: 5, scope: !55)
!67 = !DILocation(line: 95, column: 5, scope: !55)
!68 = !DILocation(line: 96, column: 5, scope: !55)
!69 = !DILocation(line: 97, column: 5, scope: !55)
!70 = !DILocation(line: 100, column: 5, scope: !55)
!71 = !DILocation(line: 101, column: 5, scope: !55)
!72 = !DILocation(line: 102, column: 5, scope: !55)
!73 = !DILocation(line: 104, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!75 = !DILocalVariable(name: "data", scope: !74, file: !14, line: 57, type: !3)
!76 = !DILocation(line: 57, column: 12, scope: !74)
!77 = !DILocalVariable(name: "myUnion", scope: !74, file: !14, line: 58, type: !21)
!78 = !DILocation(line: 58, column: 74, scope: !74)
!79 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !14, line: 59, type: !3)
!80 = !DILocation(line: 59, column: 12, scope: !74)
!81 = !DILocation(line: 59, column: 33, scope: !74)
!82 = !DILocation(line: 60, column: 12, scope: !74)
!83 = !DILocation(line: 60, column: 10, scope: !74)
!84 = !DILocation(line: 62, column: 5, scope: !74)
!85 = !DILocation(line: 63, column: 5, scope: !74)
!86 = !DILocation(line: 63, column: 16, scope: !74)
!87 = !DILocation(line: 64, column: 26, scope: !74)
!88 = !DILocation(line: 64, column: 13, scope: !74)
!89 = !DILocation(line: 64, column: 24, scope: !74)
!90 = !DILocalVariable(name: "data", scope: !91, file: !14, line: 66, type: !3)
!91 = distinct !DILexicalBlock(scope: !74, file: !14, line: 65, column: 5)
!92 = !DILocation(line: 66, column: 16, scope: !91)
!93 = !DILocation(line: 66, column: 31, scope: !91)
!94 = !DILocalVariable(name: "dest", scope: !95, file: !14, line: 68, type: !44)
!95 = distinct !DILexicalBlock(scope: !91, file: !14, line: 67, column: 9)
!96 = !DILocation(line: 68, column: 18, scope: !95)
!97 = !DILocation(line: 70, column: 13, scope: !95)
!98 = !DILocation(line: 71, column: 23, scope: !95)
!99 = !DILocation(line: 71, column: 13, scope: !95)
!100 = !DILocation(line: 74, column: 1, scope: !74)
