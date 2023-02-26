; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_04-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_04_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %0 = alloca i8, i64 10, align 16, !dbg !21
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !26, metadata !DIExpression()), !dbg !31
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !31
  %3 = load i32*, i32** %data, align 8, !dbg !32
  %4 = bitcast i32* %3 to i8*, !dbg !32
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !32
  %5 = bitcast i32* %arraydecay to i8*, !dbg !32
  %6 = load i32*, i32** %data, align 8, !dbg !32
  %7 = bitcast i32* %6 to i8*, !dbg !32
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !32
  %call = call i8* @__memmove_chk(i8* noundef %4, i8* noundef %5, i64 noundef 40, i64 noundef %8) #5, !dbg !32
  %9 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !33
  %10 = load i32, i32* %arrayidx, align 4, !dbg !33
  call void @printIntLine(i32 noundef %10), !dbg !34
  ret void, !dbg !35
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_04_good() #0 !dbg !36 {
entry:
  call void @goodG2B1(), !dbg !37
  call void @goodG2B2(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !40 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !46, metadata !DIExpression()), !dbg !47
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %call = call i64 @time(i64* noundef null), !dbg !50
  %conv = trunc i64 %call to i32, !dbg !51
  call void @srand(i32 noundef %conv), !dbg !52
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !53
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_04_good(), !dbg !54
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !56
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_04_bad(), !dbg !57
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !58
  ret i32 0, !dbg !59
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !60 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !61, metadata !DIExpression()), !dbg !62
  store i32* null, i32** %data, align 8, !dbg !63
  %0 = alloca i8, i64 40, align 16, !dbg !64
  %1 = bitcast i8* %0 to i32*, !dbg !67
  store i32* %1, i32** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !69, metadata !DIExpression()), !dbg !71
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !71
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !71
  %3 = load i32*, i32** %data, align 8, !dbg !72
  %4 = bitcast i32* %3 to i8*, !dbg !72
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !72
  %5 = bitcast i32* %arraydecay to i8*, !dbg !72
  %6 = load i32*, i32** %data, align 8, !dbg !72
  %7 = bitcast i32* %6 to i8*, !dbg !72
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !72
  %call = call i8* @__memmove_chk(i8* noundef %4, i8* noundef %5, i64 noundef 40, i64 noundef %8) #5, !dbg !72
  %9 = load i32*, i32** %data, align 8, !dbg !73
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !73
  %10 = load i32, i32* %arrayidx, align 4, !dbg !73
  call void @printIntLine(i32 noundef %10), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i32* null, i32** %data, align 8, !dbg !79
  %0 = alloca i8, i64 40, align 16, !dbg !80
  %1 = bitcast i8* %0 to i32*, !dbg !83
  store i32* %1, i32** %data, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !85, metadata !DIExpression()), !dbg !87
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !87
  %3 = load i32*, i32** %data, align 8, !dbg !88
  %4 = bitcast i32* %3 to i8*, !dbg !88
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !88
  %5 = bitcast i32* %arraydecay to i8*, !dbg !88
  %6 = load i32*, i32** %data, align 8, !dbg !88
  %7 = bitcast i32* %6 to i8*, !dbg !88
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !88
  %call = call i8* @__memmove_chk(i8* noundef %4, i8* noundef %5, i64 noundef 40, i64 noundef %8) #5, !dbg !88
  %9 = load i32*, i32** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !89
  %10 = load i32, i32* %arrayidx, align 4, !dbg !89
  call void @printIntLine(i32 noundef %10), !dbg !90
  ret void, !dbg !91
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_04_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !3)
!19 = !DILocation(line: 30, column: 11, scope: !13)
!20 = !DILocation(line: 31, column: 10, scope: !13)
!21 = !DILocation(line: 35, column: 23, scope: !22)
!22 = distinct !DILexicalBlock(scope: !23, file: !14, line: 33, column: 5)
!23 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 8)
!24 = !DILocation(line: 35, column: 16, scope: !22)
!25 = !DILocation(line: 35, column: 14, scope: !22)
!26 = !DILocalVariable(name: "source", scope: !27, file: !14, line: 38, type: !28)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 10)
!31 = !DILocation(line: 38, column: 13, scope: !27)
!32 = !DILocation(line: 40, column: 9, scope: !27)
!33 = !DILocation(line: 41, column: 22, scope: !27)
!34 = !DILocation(line: 41, column: 9, scope: !27)
!35 = !DILocation(line: 43, column: 1, scope: !13)
!36 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_04_good", scope: !14, file: !14, line: 90, type: !15, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!37 = !DILocation(line: 92, column: 5, scope: !36)
!38 = !DILocation(line: 93, column: 5, scope: !36)
!39 = !DILocation(line: 94, column: 1, scope: !36)
!40 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 106, type: !41, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!41 = !DISubroutineType(types: !42)
!42 = !{!4, !4, !43}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !40, file: !14, line: 106, type: !4)
!47 = !DILocation(line: 106, column: 14, scope: !40)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !40, file: !14, line: 106, type: !43)
!49 = !DILocation(line: 106, column: 27, scope: !40)
!50 = !DILocation(line: 109, column: 22, scope: !40)
!51 = !DILocation(line: 109, column: 12, scope: !40)
!52 = !DILocation(line: 109, column: 5, scope: !40)
!53 = !DILocation(line: 111, column: 5, scope: !40)
!54 = !DILocation(line: 112, column: 5, scope: !40)
!55 = !DILocation(line: 113, column: 5, scope: !40)
!56 = !DILocation(line: 116, column: 5, scope: !40)
!57 = !DILocation(line: 117, column: 5, scope: !40)
!58 = !DILocation(line: 118, column: 5, scope: !40)
!59 = !DILocation(line: 120, column: 5, scope: !40)
!60 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 50, type: !15, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!61 = !DILocalVariable(name: "data", scope: !60, file: !14, line: 52, type: !3)
!62 = !DILocation(line: 52, column: 11, scope: !60)
!63 = !DILocation(line: 53, column: 10, scope: !60)
!64 = !DILocation(line: 62, column: 23, scope: !65)
!65 = distinct !DILexicalBlock(scope: !66, file: !14, line: 60, column: 5)
!66 = distinct !DILexicalBlock(scope: !60, file: !14, line: 54, column: 8)
!67 = !DILocation(line: 62, column: 16, scope: !65)
!68 = !DILocation(line: 62, column: 14, scope: !65)
!69 = !DILocalVariable(name: "source", scope: !70, file: !14, line: 65, type: !28)
!70 = distinct !DILexicalBlock(scope: !60, file: !14, line: 64, column: 5)
!71 = !DILocation(line: 65, column: 13, scope: !70)
!72 = !DILocation(line: 67, column: 9, scope: !70)
!73 = !DILocation(line: 68, column: 22, scope: !70)
!74 = !DILocation(line: 68, column: 9, scope: !70)
!75 = !DILocation(line: 70, column: 1, scope: !60)
!76 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 73, type: !15, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!77 = !DILocalVariable(name: "data", scope: !76, file: !14, line: 75, type: !3)
!78 = !DILocation(line: 75, column: 11, scope: !76)
!79 = !DILocation(line: 76, column: 10, scope: !76)
!80 = !DILocation(line: 80, column: 23, scope: !81)
!81 = distinct !DILexicalBlock(scope: !82, file: !14, line: 78, column: 5)
!82 = distinct !DILexicalBlock(scope: !76, file: !14, line: 77, column: 8)
!83 = !DILocation(line: 80, column: 16, scope: !81)
!84 = !DILocation(line: 80, column: 14, scope: !81)
!85 = !DILocalVariable(name: "source", scope: !86, file: !14, line: 83, type: !28)
!86 = distinct !DILexicalBlock(scope: !76, file: !14, line: 82, column: 5)
!87 = !DILocation(line: 83, column: 13, scope: !86)
!88 = !DILocation(line: 85, column: 9, scope: !86)
!89 = !DILocation(line: 86, column: 22, scope: !86)
!90 = !DILocation(line: 86, column: 9, scope: !86)
!91 = !DILocation(line: 88, column: 1, scope: !76)
