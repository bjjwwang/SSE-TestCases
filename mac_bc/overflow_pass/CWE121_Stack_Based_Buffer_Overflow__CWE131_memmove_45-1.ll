; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_goodG2BData = internal global i32* null, align 8, !dbg !9

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %0 = alloca i8, i64 10, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %data, align 8, !dbg !28
  %2 = load i32*, i32** %data, align 8, !dbg !29
  store i32* %2, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_badData, align 8, !dbg !30
  call void @badSink(), !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_good() #0 !dbg !33 {
entry:
  call void @goodG2B(), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !36 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !42, metadata !DIExpression()), !dbg !43
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !44, metadata !DIExpression()), !dbg !45
  %call = call i64 @time(i64* noundef null), !dbg !46
  %conv = trunc i64 %call to i32, !dbg !47
  call void @srand(i32 noundef %conv), !dbg !48
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !49
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_good(), !dbg !50
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !51
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !52
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_bad(), !dbg !53
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !54
  ret i32 0, !dbg !55
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !56 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_badData, align 8, !dbg !59
  store i32* %0, i32** %data, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !60, metadata !DIExpression()), !dbg !65
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !65
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !65
  %2 = load i32*, i32** %data, align 8, !dbg !66
  %3 = bitcast i32* %2 to i8*, !dbg !66
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !66
  %4 = bitcast i32* %arraydecay to i8*, !dbg !66
  %5 = load i32*, i32** %data, align 8, !dbg !66
  %6 = bitcast i32* %5 to i8*, !dbg !66
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !66
  %call = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef 40, i64 noundef %7) #5, !dbg !66
  %8 = load i32*, i32** %data, align 8, !dbg !67
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !67
  %9 = load i32, i32* %arrayidx, align 4, !dbg !67
  call void @printIntLine(i32 noundef %9), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  store i32* null, i32** %data, align 8, !dbg !73
  %0 = alloca i8, i64 40, align 16, !dbg !74
  %1 = bitcast i8* %0 to i32*, !dbg !75
  store i32* %1, i32** %data, align 8, !dbg !76
  %2 = load i32*, i32** %data, align 8, !dbg !77
  store i32* %2, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_goodG2BData, align 8, !dbg !78
  call void @goodG2BSink(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_goodG2BData, align 8, !dbg !84
  store i32* %0, i32** %data, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !85, metadata !DIExpression()), !dbg !87
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !87
  %2 = load i32*, i32** %data, align 8, !dbg !88
  %3 = bitcast i32* %2 to i8*, !dbg !88
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !88
  %4 = bitcast i32* %arraydecay to i8*, !dbg !88
  %5 = load i32*, i32** %data, align 8, !dbg !88
  %6 = bitcast i32* %5 to i8*, !dbg !88
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !88
  %call = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef 40, i64 noundef %7) #5, !dbg !88
  %8 = load i32*, i32** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !89
  %9 = load i32, i32* %arrayidx, align 4, !dbg !89
  call void @printIntLine(i32 noundef %9), !dbg !90
  ret void, !dbg !91
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_badData", scope: !2, file: !11, line: 19, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_goodG2BData", scope: !2, file: !11, line: 20, type: !5, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Homebrew clang version 14.0.6"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_bad", scope: !11, file: !11, line: 35, type: !20, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 37, type: !5)
!24 = !DILocation(line: 37, column: 11, scope: !19)
!25 = !DILocation(line: 38, column: 10, scope: !19)
!26 = !DILocation(line: 40, column: 19, scope: !19)
!27 = !DILocation(line: 40, column: 12, scope: !19)
!28 = !DILocation(line: 40, column: 10, scope: !19)
!29 = !DILocation(line: 41, column: 69, scope: !19)
!30 = !DILocation(line: 41, column: 67, scope: !19)
!31 = !DILocation(line: 42, column: 5, scope: !19)
!32 = !DILocation(line: 43, column: 1, scope: !19)
!33 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_good", scope: !11, file: !11, line: 71, type: !20, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!34 = !DILocation(line: 73, column: 5, scope: !33)
!35 = !DILocation(line: 74, column: 1, scope: !33)
!36 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 85, type: !37, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!37 = !DISubroutineType(types: !38)
!38 = !{!6, !6, !39}
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!42 = !DILocalVariable(name: "argc", arg: 1, scope: !36, file: !11, line: 85, type: !6)
!43 = !DILocation(line: 85, column: 14, scope: !36)
!44 = !DILocalVariable(name: "argv", arg: 2, scope: !36, file: !11, line: 85, type: !39)
!45 = !DILocation(line: 85, column: 27, scope: !36)
!46 = !DILocation(line: 88, column: 22, scope: !36)
!47 = !DILocation(line: 88, column: 12, scope: !36)
!48 = !DILocation(line: 88, column: 5, scope: !36)
!49 = !DILocation(line: 90, column: 5, scope: !36)
!50 = !DILocation(line: 91, column: 5, scope: !36)
!51 = !DILocation(line: 92, column: 5, scope: !36)
!52 = !DILocation(line: 95, column: 5, scope: !36)
!53 = !DILocation(line: 96, column: 5, scope: !36)
!54 = !DILocation(line: 97, column: 5, scope: !36)
!55 = !DILocation(line: 99, column: 5, scope: !36)
!56 = distinct !DISubprogram(name: "badSink", scope: !11, file: !11, line: 24, type: !20, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!57 = !DILocalVariable(name: "data", scope: !56, file: !11, line: 26, type: !5)
!58 = !DILocation(line: 26, column: 11, scope: !56)
!59 = !DILocation(line: 26, column: 18, scope: !56)
!60 = !DILocalVariable(name: "source", scope: !61, file: !11, line: 28, type: !62)
!61 = distinct !DILexicalBlock(scope: !56, file: !11, line: 27, column: 5)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 320, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 10)
!65 = !DILocation(line: 28, column: 13, scope: !61)
!66 = !DILocation(line: 30, column: 9, scope: !61)
!67 = !DILocation(line: 31, column: 22, scope: !61)
!68 = !DILocation(line: 31, column: 9, scope: !61)
!69 = !DILocation(line: 33, column: 1, scope: !56)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !11, file: !11, line: 61, type: !20, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!71 = !DILocalVariable(name: "data", scope: !70, file: !11, line: 63, type: !5)
!72 = !DILocation(line: 63, column: 11, scope: !70)
!73 = !DILocation(line: 64, column: 10, scope: !70)
!74 = !DILocation(line: 66, column: 19, scope: !70)
!75 = !DILocation(line: 66, column: 12, scope: !70)
!76 = !DILocation(line: 66, column: 10, scope: !70)
!77 = !DILocation(line: 67, column: 73, scope: !70)
!78 = !DILocation(line: 67, column: 71, scope: !70)
!79 = !DILocation(line: 68, column: 5, scope: !70)
!80 = !DILocation(line: 69, column: 1, scope: !70)
!81 = distinct !DISubprogram(name: "goodG2BSink", scope: !11, file: !11, line: 50, type: !20, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!82 = !DILocalVariable(name: "data", scope: !81, file: !11, line: 52, type: !5)
!83 = !DILocation(line: 52, column: 11, scope: !81)
!84 = !DILocation(line: 52, column: 18, scope: !81)
!85 = !DILocalVariable(name: "source", scope: !86, file: !11, line: 54, type: !62)
!86 = distinct !DILexicalBlock(scope: !81, file: !11, line: 53, column: 5)
!87 = !DILocation(line: 54, column: 13, scope: !86)
!88 = !DILocation(line: 56, column: 9, scope: !86)
!89 = !DILocation(line: 57, column: 22, scope: !86)
!90 = !DILocation(line: 57, column: 9, scope: !86)
!91 = !DILocation(line: 59, column: 1, scope: !81)
