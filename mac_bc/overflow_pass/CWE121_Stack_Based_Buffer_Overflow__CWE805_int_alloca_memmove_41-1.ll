; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_badSink(i32* noundef %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !20, metadata !DIExpression()), !dbg !25
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !25
  %1 = load i32*, i32** %data.addr, align 8, !dbg !26
  %2 = bitcast i32* %1 to i8*, !dbg !26
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !26
  %3 = bitcast i32* %arraydecay to i8*, !dbg !26
  %4 = load i32*, i32** %data.addr, align 8, !dbg !26
  %5 = bitcast i32* %4 to i8*, !dbg !26
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !26
  %call = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 400, i64 noundef %6) #5, !dbg !26
  %7 = load i32*, i32** %data.addr, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !27
  %8 = load i32, i32* %arrayidx, align 4, !dbg !27
  call void @printIntLine(i32 noundef %8), !dbg !28
  ret void, !dbg !29
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printIntLine(i32 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_bad() #0 !dbg !30 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !35, metadata !DIExpression()), !dbg !36
  %0 = alloca i8, i64 200, align 16, !dbg !37
  %1 = bitcast i8* %0 to i32*, !dbg !38
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !39, metadata !DIExpression()), !dbg !40
  %2 = alloca i8, i64 400, align 16, !dbg !41
  %3 = bitcast i8* %2 to i32*, !dbg !42
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !40
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !43
  store i32* %4, i32** %data, align 8, !dbg !44
  %5 = load i32*, i32** %data, align 8, !dbg !45
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_badSink(i32* noundef %5), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_goodG2BSink(i32* noundef %data) #0 !dbg !48 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !51, metadata !DIExpression()), !dbg !53
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !53
  %1 = load i32*, i32** %data.addr, align 8, !dbg !54
  %2 = bitcast i32* %1 to i8*, !dbg !54
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !54
  %3 = bitcast i32* %arraydecay to i8*, !dbg !54
  %4 = load i32*, i32** %data.addr, align 8, !dbg !54
  %5 = bitcast i32* %4 to i8*, !dbg !54
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !54
  %call = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 400, i64 noundef %6) #5, !dbg !54
  %7 = load i32*, i32** %data.addr, align 8, !dbg !55
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !55
  %8 = load i32, i32* %arrayidx, align 4, !dbg !55
  call void @printIntLine(i32 noundef %8), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* noundef null), !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 noundef %conv), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_good(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_bad(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = alloca i8, i64 200, align 16, !dbg !86
  %1 = bitcast i8* %0 to i32*, !dbg !87
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %2 = alloca i8, i64 400, align 16, !dbg !90
  %3 = bitcast i8* %2 to i32*, !dbg !91
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !89
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !92
  store i32* %4, i32** %data, align 8, !dbg !93
  %5 = load i32*, i32** %data, align 8, !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_goodG2BSink(i32* noundef %5), !dbg !95
  ret void, !dbg !96
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_badSink", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !3}
!17 = !{}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 21, type: !3)
!19 = !DILocation(line: 21, column: 85, scope: !13)
!20 = !DILocalVariable(name: "source", scope: !21, file: !14, line: 24, type: !22)
!21 = distinct !DILexicalBlock(scope: !13, file: !14, line: 23, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 24, column: 13, scope: !21)
!26 = !DILocation(line: 26, column: 9, scope: !21)
!27 = !DILocation(line: 27, column: 22, scope: !21)
!28 = !DILocation(line: 27, column: 9, scope: !21)
!29 = !DILocation(line: 29, column: 1, scope: !13)
!30 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_bad", scope: !14, file: !14, line: 31, type: !31, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!31 = !DISubroutineType(types: !32)
!32 = !{null}
!33 = !DILocalVariable(name: "data", scope: !30, file: !14, line: 33, type: !3)
!34 = !DILocation(line: 33, column: 11, scope: !30)
!35 = !DILocalVariable(name: "dataBadBuffer", scope: !30, file: !14, line: 34, type: !3)
!36 = !DILocation(line: 34, column: 11, scope: !30)
!37 = !DILocation(line: 34, column: 34, scope: !30)
!38 = !DILocation(line: 34, column: 27, scope: !30)
!39 = !DILocalVariable(name: "dataGoodBuffer", scope: !30, file: !14, line: 35, type: !3)
!40 = !DILocation(line: 35, column: 11, scope: !30)
!41 = !DILocation(line: 35, column: 35, scope: !30)
!42 = !DILocation(line: 35, column: 28, scope: !30)
!43 = !DILocation(line: 38, column: 12, scope: !30)
!44 = !DILocation(line: 38, column: 10, scope: !30)
!45 = !DILocation(line: 39, column: 78, scope: !30)
!46 = !DILocation(line: 39, column: 5, scope: !30)
!47 = !DILocation(line: 40, column: 1, scope: !30)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_goodG2BSink", scope: !14, file: !14, line: 46, type: !15, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!49 = !DILocalVariable(name: "data", arg: 1, scope: !48, file: !14, line: 46, type: !3)
!50 = !DILocation(line: 46, column: 89, scope: !48)
!51 = !DILocalVariable(name: "source", scope: !52, file: !14, line: 49, type: !22)
!52 = distinct !DILexicalBlock(scope: !48, file: !14, line: 48, column: 5)
!53 = !DILocation(line: 49, column: 13, scope: !52)
!54 = !DILocation(line: 51, column: 9, scope: !52)
!55 = !DILocation(line: 52, column: 22, scope: !52)
!56 = !DILocation(line: 52, column: 9, scope: !52)
!57 = !DILocation(line: 54, column: 1, scope: !48)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_good", scope: !14, file: !14, line: 67, type: !31, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!59 = !DILocation(line: 69, column: 5, scope: !58)
!60 = !DILocation(line: 70, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 82, type: !62, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!62 = !DISubroutineType(types: !63)
!63 = !{!4, !4, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !14, line: 82, type: !4)
!68 = !DILocation(line: 82, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !14, line: 82, type: !64)
!70 = !DILocation(line: 82, column: 27, scope: !61)
!71 = !DILocation(line: 85, column: 22, scope: !61)
!72 = !DILocation(line: 85, column: 12, scope: !61)
!73 = !DILocation(line: 85, column: 5, scope: !61)
!74 = !DILocation(line: 87, column: 5, scope: !61)
!75 = !DILocation(line: 88, column: 5, scope: !61)
!76 = !DILocation(line: 89, column: 5, scope: !61)
!77 = !DILocation(line: 92, column: 5, scope: !61)
!78 = !DILocation(line: 93, column: 5, scope: !61)
!79 = !DILocation(line: 94, column: 5, scope: !61)
!80 = !DILocation(line: 96, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 57, type: !31, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!82 = !DILocalVariable(name: "data", scope: !81, file: !14, line: 59, type: !3)
!83 = !DILocation(line: 59, column: 11, scope: !81)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !81, file: !14, line: 60, type: !3)
!85 = !DILocation(line: 60, column: 11, scope: !81)
!86 = !DILocation(line: 60, column: 34, scope: !81)
!87 = !DILocation(line: 60, column: 27, scope: !81)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !14, line: 61, type: !3)
!89 = !DILocation(line: 61, column: 11, scope: !81)
!90 = !DILocation(line: 61, column: 35, scope: !81)
!91 = !DILocation(line: 61, column: 28, scope: !81)
!92 = !DILocation(line: 63, column: 12, scope: !81)
!93 = !DILocation(line: 63, column: 10, scope: !81)
!94 = !DILocation(line: 64, column: 82, scope: !81)
!95 = !DILocation(line: 64, column: 5, scope: !81)
!96 = !DILocation(line: 65, column: 1, scope: !81)
