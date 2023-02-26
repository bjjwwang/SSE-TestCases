; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_44-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_44-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_44_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %0 = alloca i8, i64 10, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %data, align 8, !dbg !28
  %2 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !29
  %3 = load i32*, i32** %data, align 8, !dbg !30
  call void %2(i32* noundef %3), !dbg !29
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i32* noundef %data) #0 !dbg !32 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %0 = bitcast [10 x i32]* %source to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !40
  %1 = load i32*, i32** %data.addr, align 8, !dbg !41
  %2 = bitcast i32* %1 to i8*, !dbg !41
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !41
  %3 = bitcast i32* %arraydecay to i8*, !dbg !41
  %4 = load i32*, i32** %data.addr, align 8, !dbg !41
  %5 = bitcast i32* %4 to i8*, !dbg !41
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !41
  %call = call i8* @__memcpy_chk(i8* noundef %2, i8* noundef %3, i64 noundef 40, i64 noundef %6) #5, !dbg !41
  %7 = load i32*, i32** %data.addr, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !42
  %8 = load i32, i32* %arrayidx, align 4, !dbg !42
  call void @printIntLine(i32 noundef %8), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_44_good() #0 !dbg !45 {
entry:
  call void @goodG2B(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* noundef null), !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 noundef %conv), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_44_good(), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_44_bad(), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !68 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !71, metadata !DIExpression()), !dbg !72
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !72
  store i32* null, i32** %data, align 8, !dbg !73
  %0 = alloca i8, i64 40, align 16, !dbg !74
  %1 = bitcast i8* %0 to i32*, !dbg !75
  store i32* %1, i32** %data, align 8, !dbg !76
  %2 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !77
  %3 = load i32*, i32** %data, align 8, !dbg !78
  call void %2(i32* noundef %3), !dbg !77
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i32* noundef %data) #0 !dbg !80 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !83, metadata !DIExpression()), !dbg !85
  %0 = bitcast [10 x i32]* %source to i8*, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !85
  %1 = load i32*, i32** %data.addr, align 8, !dbg !86
  %2 = bitcast i32* %1 to i8*, !dbg !86
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !86
  %3 = bitcast i32* %arraydecay to i8*, !dbg !86
  %4 = load i32*, i32** %data.addr, align 8, !dbg !86
  %5 = bitcast i32* %4 to i8*, !dbg !86
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !86
  %call = call i8* @__memcpy_chk(i8* noundef %2, i8* noundef %3, i64 noundef 40, i64 noundef %6) #5, !dbg !86
  %7 = load i32*, i32** %data.addr, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !87
  %8 = load i32, i32* %arrayidx, align 4, !dbg !87
  call void @printIntLine(i32 noundef %8), !dbg !88
  ret void, !dbg !89
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_44_bad", scope: !14, file: !14, line: 31, type: !15, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 33, type: !3)
!19 = !DILocation(line: 33, column: 11, scope: !13)
!20 = !DILocalVariable(name: "funcPtr", scope: !13, file: !14, line: 35, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !3}
!24 = !DILocation(line: 35, column: 12, scope: !13)
!25 = !DILocation(line: 36, column: 10, scope: !13)
!26 = !DILocation(line: 38, column: 19, scope: !13)
!27 = !DILocation(line: 38, column: 12, scope: !13)
!28 = !DILocation(line: 38, column: 10, scope: !13)
!29 = !DILocation(line: 40, column: 5, scope: !13)
!30 = !DILocation(line: 40, column: 13, scope: !13)
!31 = !DILocation(line: 41, column: 1, scope: !13)
!32 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 21, type: !22, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!33 = !DILocalVariable(name: "data", arg: 1, scope: !32, file: !14, line: 21, type: !3)
!34 = !DILocation(line: 21, column: 27, scope: !32)
!35 = !DILocalVariable(name: "source", scope: !36, file: !14, line: 24, type: !37)
!36 = distinct !DILexicalBlock(scope: !32, file: !14, line: 23, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 10)
!40 = !DILocation(line: 24, column: 13, scope: !36)
!41 = !DILocation(line: 26, column: 9, scope: !36)
!42 = !DILocation(line: 27, column: 22, scope: !36)
!43 = !DILocation(line: 27, column: 9, scope: !36)
!44 = !DILocation(line: 29, column: 1, scope: !32)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_44_good", scope: !14, file: !14, line: 68, type: !15, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!46 = !DILocation(line: 70, column: 5, scope: !45)
!47 = !DILocation(line: 71, column: 1, scope: !45)
!48 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 82, type: !49, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!49 = !DISubroutineType(types: !50)
!50 = !{!4, !4, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !14, line: 82, type: !4)
!55 = !DILocation(line: 82, column: 14, scope: !48)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !14, line: 82, type: !51)
!57 = !DILocation(line: 82, column: 27, scope: !48)
!58 = !DILocation(line: 85, column: 22, scope: !48)
!59 = !DILocation(line: 85, column: 12, scope: !48)
!60 = !DILocation(line: 85, column: 5, scope: !48)
!61 = !DILocation(line: 87, column: 5, scope: !48)
!62 = !DILocation(line: 88, column: 5, scope: !48)
!63 = !DILocation(line: 89, column: 5, scope: !48)
!64 = !DILocation(line: 92, column: 5, scope: !48)
!65 = !DILocation(line: 93, column: 5, scope: !48)
!66 = !DILocation(line: 94, column: 5, scope: !48)
!67 = !DILocation(line: 96, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 58, type: !15, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!69 = !DILocalVariable(name: "data", scope: !68, file: !14, line: 60, type: !3)
!70 = !DILocation(line: 60, column: 11, scope: !68)
!71 = !DILocalVariable(name: "funcPtr", scope: !68, file: !14, line: 61, type: !21)
!72 = !DILocation(line: 61, column: 12, scope: !68)
!73 = !DILocation(line: 62, column: 10, scope: !68)
!74 = !DILocation(line: 64, column: 19, scope: !68)
!75 = !DILocation(line: 64, column: 12, scope: !68)
!76 = !DILocation(line: 64, column: 10, scope: !68)
!77 = !DILocation(line: 65, column: 5, scope: !68)
!78 = !DILocation(line: 65, column: 13, scope: !68)
!79 = !DILocation(line: 66, column: 1, scope: !68)
!80 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 48, type: !22, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!81 = !DILocalVariable(name: "data", arg: 1, scope: !80, file: !14, line: 48, type: !3)
!82 = !DILocation(line: 48, column: 31, scope: !80)
!83 = !DILocalVariable(name: "source", scope: !84, file: !14, line: 51, type: !37)
!84 = distinct !DILexicalBlock(scope: !80, file: !14, line: 50, column: 5)
!85 = !DILocation(line: 51, column: 13, scope: !84)
!86 = !DILocation(line: 53, column: 9, scope: !84)
!87 = !DILocation(line: 54, column: 22, scope: !84)
!88 = !DILocation(line: 54, column: 9, scope: !84)
!89 = !DILocation(line: 56, column: 1, scope: !80)
