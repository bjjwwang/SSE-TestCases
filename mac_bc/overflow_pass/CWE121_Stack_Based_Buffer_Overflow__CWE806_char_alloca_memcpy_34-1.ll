; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_34_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_34_unionType, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
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
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_34_unionType* %myUnion to i8**, !dbg !36
  store i8* %6, i8** %unionFirst, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !38, metadata !DIExpression()), !dbg !40
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_34_unionType* %myUnion to i8**, !dbg !41
  %7 = load i8*, i8** %unionSecond, align 8, !dbg !41
  store i8* %7, i8** %data1, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %8 = bitcast [50 x i8]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 50, i1 false), !dbg !47
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !48
  %9 = load i8*, i8** %data1, align 8, !dbg !48
  %10 = load i8*, i8** %data1, align 8, !dbg !48
  %call2 = call i64 @strlen(i8* noundef %10), !dbg !48
  %mul = mul i64 %call2, 1, !dbg !48
  %call3 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %9, i64 noundef %mul, i64 noundef 50) #5, !dbg !48
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !49
  store i8 0, i8* %arrayidx4, align 1, !dbg !50
  %11 = load i8*, i8** %data1, align 8, !dbg !51
  call void @printLine(i8* noundef %11), !dbg !52
  ret void, !dbg !53
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
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_34_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* noundef null), !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 noundef %conv), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_34_good(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_34_bad(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_34_unionType, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_34_unionType* %myUnion, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 100, align 16, !dbg !83
  store i8* %0, i8** %dataBuffer, align 8, !dbg !82
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !84
  store i8* %1, i8** %data, align 8, !dbg !85
  %2 = load i8*, i8** %data, align 8, !dbg !86
  %3 = load i8*, i8** %data, align 8, !dbg !86
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !86
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !86
  %5 = load i8*, i8** %data, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !87
  store i8 0, i8* %arrayidx, align 1, !dbg !88
  %6 = load i8*, i8** %data, align 8, !dbg !89
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_34_unionType* %myUnion to i8**, !dbg !90
  store i8* %6, i8** %unionFirst, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !92, metadata !DIExpression()), !dbg !94
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_34_unionType* %myUnion to i8**, !dbg !95
  %7 = load i8*, i8** %unionSecond, align 8, !dbg !95
  store i8* %7, i8** %data1, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !96, metadata !DIExpression()), !dbg !98
  %8 = bitcast [50 x i8]* %dest to i8*, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 50, i1 false), !dbg !98
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !99
  %9 = load i8*, i8** %data1, align 8, !dbg !99
  %10 = load i8*, i8** %data1, align 8, !dbg !99
  %call2 = call i64 @strlen(i8* noundef %10), !dbg !99
  %mul = mul i64 %call2, 1, !dbg !99
  %call3 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %9, i64 noundef %mul, i64 noundef 50) #5, !dbg !99
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !100
  store i8 0, i8* %arrayidx4, align 1, !dbg !101
  %11 = load i8*, i8** %data1, align 8, !dbg !102
  call void @printLine(i8* noundef %11), !dbg !103
  ret void, !dbg !104
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_34_bad", scope: !14, file: !14, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 31, type: !3)
!19 = !DILocation(line: 31, column: 12, scope: !13)
!20 = !DILocalVariable(name: "myUnion", scope: !13, file: !14, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_34_unionType", file: !14, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !14, line: 21, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !14, line: 23, baseType: !3, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !14, line: 24, baseType: !3, size: 64)
!26 = !DILocation(line: 32, column: 80, scope: !13)
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
!49 = !DILocation(line: 45, column: 13, scope: !43)
!50 = !DILocation(line: 45, column: 24, scope: !43)
!51 = !DILocation(line: 46, column: 23, scope: !43)
!52 = !DILocation(line: 46, column: 13, scope: !43)
!53 = !DILocation(line: 49, column: 1, scope: !13)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_34_good", scope: !14, file: !14, line: 78, type: !15, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!55 = !DILocation(line: 80, column: 5, scope: !54)
!56 = !DILocation(line: 81, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 92, type: !58, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !60, !61}
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !14, line: 92, type: !60)
!63 = !DILocation(line: 92, column: 14, scope: !57)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !14, line: 92, type: !61)
!65 = !DILocation(line: 92, column: 27, scope: !57)
!66 = !DILocation(line: 95, column: 22, scope: !57)
!67 = !DILocation(line: 95, column: 12, scope: !57)
!68 = !DILocation(line: 95, column: 5, scope: !57)
!69 = !DILocation(line: 97, column: 5, scope: !57)
!70 = !DILocation(line: 98, column: 5, scope: !57)
!71 = !DILocation(line: 99, column: 5, scope: !57)
!72 = !DILocation(line: 102, column: 5, scope: !57)
!73 = !DILocation(line: 103, column: 5, scope: !57)
!74 = !DILocation(line: 104, column: 5, scope: !57)
!75 = !DILocation(line: 106, column: 5, scope: !57)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 56, type: !15, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!77 = !DILocalVariable(name: "data", scope: !76, file: !14, line: 58, type: !3)
!78 = !DILocation(line: 58, column: 12, scope: !76)
!79 = !DILocalVariable(name: "myUnion", scope: !76, file: !14, line: 59, type: !21)
!80 = !DILocation(line: 59, column: 80, scope: !76)
!81 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !14, line: 60, type: !3)
!82 = !DILocation(line: 60, column: 12, scope: !76)
!83 = !DILocation(line: 60, column: 33, scope: !76)
!84 = !DILocation(line: 61, column: 12, scope: !76)
!85 = !DILocation(line: 61, column: 10, scope: !76)
!86 = !DILocation(line: 63, column: 5, scope: !76)
!87 = !DILocation(line: 64, column: 5, scope: !76)
!88 = !DILocation(line: 64, column: 16, scope: !76)
!89 = !DILocation(line: 65, column: 26, scope: !76)
!90 = !DILocation(line: 65, column: 13, scope: !76)
!91 = !DILocation(line: 65, column: 24, scope: !76)
!92 = !DILocalVariable(name: "data", scope: !93, file: !14, line: 67, type: !3)
!93 = distinct !DILexicalBlock(scope: !76, file: !14, line: 66, column: 5)
!94 = !DILocation(line: 67, column: 16, scope: !93)
!95 = !DILocation(line: 67, column: 31, scope: !93)
!96 = !DILocalVariable(name: "dest", scope: !97, file: !14, line: 69, type: !44)
!97 = distinct !DILexicalBlock(scope: !93, file: !14, line: 68, column: 9)
!98 = !DILocation(line: 69, column: 18, scope: !97)
!99 = !DILocation(line: 71, column: 13, scope: !97)
!100 = !DILocation(line: 72, column: 13, scope: !97)
!101 = !DILocation(line: 72, column: 24, scope: !97)
!102 = !DILocation(line: 73, column: 23, scope: !97)
!103 = !DILocation(line: 73, column: 13, scope: !97)
!104 = !DILocation(line: 76, column: 1, scope: !76)
