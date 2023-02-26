; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_badSink(i8* noundef %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !20, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !26
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %0 = load i8*, i8** %data.addr, align 8, !dbg !29
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !29
  %1 = load i8*, i8** %data.addr, align 8, !dbg !29
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !29
  %call = call i8* @__strncpy_chk(i8* noundef %0, i8* noundef %arraydecay1, i64 noundef 99, i64 noundef %2) #5, !dbg !29
  %3 = load i8*, i8** %data.addr, align 8, !dbg !30
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !30
  store i8 0, i8* %arrayidx2, align 1, !dbg !31
  %4 = load i8*, i8** %data.addr, align 8, !dbg !32
  call void @printLine(i8* noundef %4), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_bad() #0 !dbg !35 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !40, metadata !DIExpression()), !dbg !41
  %0 = alloca i8, i64 50, align 16, !dbg !42
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !43, metadata !DIExpression()), !dbg !44
  %1 = alloca i8, i64 100, align 16, !dbg !45
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !44
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !46
  store i8* %2, i8** %data, align 8, !dbg !47
  %3 = load i8*, i8** %data, align 8, !dbg !48
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !48
  store i8 0, i8* %arrayidx, align 1, !dbg !49
  %4 = load i8*, i8** %data, align 8, !dbg !50
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_badSink(i8* noundef %4), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_goodG2BSink(i8* noundef %data) #0 !dbg !53 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !56, metadata !DIExpression()), !dbg !58
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !59
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !60
  store i8 0, i8* %arrayidx, align 1, !dbg !61
  %0 = load i8*, i8** %data.addr, align 8, !dbg !62
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !62
  %1 = load i8*, i8** %data.addr, align 8, !dbg !62
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !62
  %call = call i8* @__strncpy_chk(i8* noundef %0, i8* noundef %arraydecay1, i64 noundef 99, i64 noundef %2) #5, !dbg !62
  %3 = load i8*, i8** %data.addr, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !63
  store i8 0, i8* %arrayidx2, align 1, !dbg !64
  %4 = load i8*, i8** %data.addr, align 8, !dbg !65
  call void @printLine(i8* noundef %4), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* noundef null), !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 noundef %conv), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_good(), !dbg !84
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_bad(), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = alloca i8, i64 50, align 16, !dbg !95
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %1 = alloca i8, i64 100, align 16, !dbg !98
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !97
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !99
  store i8* %2, i8** %data, align 8, !dbg !100
  %3 = load i8*, i8** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !101
  store i8 0, i8* %arrayidx, align 1, !dbg !102
  %4 = load i8*, i8** %data, align 8, !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_goodG2BSink(i8* noundef %4), !dbg !104
  ret void, !dbg !105
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_badSink", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !3}
!17 = !{}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 23, type: !3)
!19 = !DILocation(line: 23, column: 84, scope: !13)
!20 = !DILocalVariable(name: "source", scope: !21, file: !14, line: 26, type: !22)
!21 = distinct !DILexicalBlock(scope: !13, file: !14, line: 25, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 14, scope: !21)
!26 = !DILocation(line: 27, column: 9, scope: !21)
!27 = !DILocation(line: 28, column: 9, scope: !21)
!28 = !DILocation(line: 28, column: 23, scope: !21)
!29 = !DILocation(line: 30, column: 9, scope: !21)
!30 = !DILocation(line: 31, column: 9, scope: !21)
!31 = !DILocation(line: 31, column: 21, scope: !21)
!32 = !DILocation(line: 32, column: 19, scope: !21)
!33 = !DILocation(line: 32, column: 9, scope: !21)
!34 = !DILocation(line: 34, column: 1, scope: !13)
!35 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_bad", scope: !14, file: !14, line: 36, type: !36, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!36 = !DISubroutineType(types: !37)
!37 = !{null}
!38 = !DILocalVariable(name: "data", scope: !35, file: !14, line: 38, type: !3)
!39 = !DILocation(line: 38, column: 12, scope: !35)
!40 = !DILocalVariable(name: "dataBadBuffer", scope: !35, file: !14, line: 39, type: !3)
!41 = !DILocation(line: 39, column: 12, scope: !35)
!42 = !DILocation(line: 39, column: 36, scope: !35)
!43 = !DILocalVariable(name: "dataGoodBuffer", scope: !35, file: !14, line: 40, type: !3)
!44 = !DILocation(line: 40, column: 12, scope: !35)
!45 = !DILocation(line: 40, column: 37, scope: !35)
!46 = !DILocation(line: 43, column: 12, scope: !35)
!47 = !DILocation(line: 43, column: 10, scope: !35)
!48 = !DILocation(line: 44, column: 5, scope: !35)
!49 = !DILocation(line: 44, column: 13, scope: !35)
!50 = !DILocation(line: 45, column: 76, scope: !35)
!51 = !DILocation(line: 45, column: 5, scope: !35)
!52 = !DILocation(line: 46, column: 1, scope: !35)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_goodG2BSink", scope: !14, file: !14, line: 52, type: !15, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!54 = !DILocalVariable(name: "data", arg: 1, scope: !53, file: !14, line: 52, type: !3)
!55 = !DILocation(line: 52, column: 88, scope: !53)
!56 = !DILocalVariable(name: "source", scope: !57, file: !14, line: 55, type: !22)
!57 = distinct !DILexicalBlock(scope: !53, file: !14, line: 54, column: 5)
!58 = !DILocation(line: 55, column: 14, scope: !57)
!59 = !DILocation(line: 56, column: 9, scope: !57)
!60 = !DILocation(line: 57, column: 9, scope: !57)
!61 = !DILocation(line: 57, column: 23, scope: !57)
!62 = !DILocation(line: 59, column: 9, scope: !57)
!63 = !DILocation(line: 60, column: 9, scope: !57)
!64 = !DILocation(line: 60, column: 21, scope: !57)
!65 = !DILocation(line: 61, column: 19, scope: !57)
!66 = !DILocation(line: 61, column: 9, scope: !57)
!67 = !DILocation(line: 63, column: 1, scope: !53)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_good", scope: !14, file: !14, line: 77, type: !36, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!69 = !DILocation(line: 79, column: 5, scope: !68)
!70 = !DILocation(line: 80, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 92, type: !72, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!72 = !DISubroutineType(types: !73)
!73 = !{!74, !74, !75}
!74 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !14, line: 92, type: !74)
!77 = !DILocation(line: 92, column: 14, scope: !71)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !14, line: 92, type: !75)
!79 = !DILocation(line: 92, column: 27, scope: !71)
!80 = !DILocation(line: 95, column: 22, scope: !71)
!81 = !DILocation(line: 95, column: 12, scope: !71)
!82 = !DILocation(line: 95, column: 5, scope: !71)
!83 = !DILocation(line: 97, column: 5, scope: !71)
!84 = !DILocation(line: 98, column: 5, scope: !71)
!85 = !DILocation(line: 99, column: 5, scope: !71)
!86 = !DILocation(line: 102, column: 5, scope: !71)
!87 = !DILocation(line: 103, column: 5, scope: !71)
!88 = !DILocation(line: 104, column: 5, scope: !71)
!89 = !DILocation(line: 106, column: 5, scope: !71)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 66, type: !36, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!91 = !DILocalVariable(name: "data", scope: !90, file: !14, line: 68, type: !3)
!92 = !DILocation(line: 68, column: 12, scope: !90)
!93 = !DILocalVariable(name: "dataBadBuffer", scope: !90, file: !14, line: 69, type: !3)
!94 = !DILocation(line: 69, column: 12, scope: !90)
!95 = !DILocation(line: 69, column: 36, scope: !90)
!96 = !DILocalVariable(name: "dataGoodBuffer", scope: !90, file: !14, line: 70, type: !3)
!97 = !DILocation(line: 70, column: 12, scope: !90)
!98 = !DILocation(line: 70, column: 37, scope: !90)
!99 = !DILocation(line: 72, column: 12, scope: !90)
!100 = !DILocation(line: 72, column: 10, scope: !90)
!101 = !DILocation(line: 73, column: 5, scope: !90)
!102 = !DILocation(line: 73, column: 13, scope: !90)
!103 = !DILocation(line: 74, column: 80, scope: !90)
!104 = !DILocation(line: 74, column: 5, scope: !90)
!105 = !DILocation(line: 75, column: 1, scope: !90)
