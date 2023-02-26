; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_15_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 100, align 16, !dbg !22
  store i8* %0, i8** %dataBuffer, align 8, !dbg !21
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !23
  store i8* %1, i8** %data, align 8, !dbg !24
  %2 = load i8*, i8** %data, align 8, !dbg !25
  %3 = load i8*, i8** %data, align 8, !dbg !25
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !25
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #5, !dbg !25
  %5 = load i8*, i8** %data, align 8, !dbg !26
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !26
  store i8 0, i8* %arrayidx, align 1, !dbg !27
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !28, metadata !DIExpression()), !dbg !33
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !34
  %7 = load i8*, i8** %data, align 8, !dbg !34
  %call1 = call i8* @__strcpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef 50) #5, !dbg !34
  %8 = load i8*, i8** %data, align 8, !dbg !35
  call void @printLine(i8* noundef %8), !dbg !36
  ret void, !dbg !37
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
define void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_15_good() #0 !dbg !38 {
entry:
  call void @goodG2B1(), !dbg !39
  call void @goodG2B2(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !47, metadata !DIExpression()), !dbg !48
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %call = call i64 @time(i64* noundef null), !dbg !51
  %conv = trunc i64 %call to i32, !dbg !52
  call void @srand(i32 noundef %conv), !dbg !53
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !54
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_15_good(), !dbg !55
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_15_bad(), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !59
  ret i32 0, !dbg !60
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !61 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = alloca i8, i64 100, align 16, !dbg !66
  store i8* %0, i8** %dataBuffer, align 8, !dbg !65
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !67
  store i8* %1, i8** %data, align 8, !dbg !68
  %2 = load i8*, i8** %data, align 8, !dbg !69
  %3 = load i8*, i8** %data, align 8, !dbg !69
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !69
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !69
  %5 = load i8*, i8** %data, align 8, !dbg !70
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !70
  store i8 0, i8* %arrayidx, align 1, !dbg !71
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !72, metadata !DIExpression()), !dbg !74
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !74
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !74
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !75
  %7 = load i8*, i8** %data, align 8, !dbg !75
  %call1 = call i8* @__strcpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef 50) #5, !dbg !75
  %8 = load i8*, i8** %data, align 8, !dbg !76
  call void @printLine(i8* noundef %8), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = alloca i8, i64 100, align 16, !dbg !84
  store i8* %0, i8** %dataBuffer, align 8, !dbg !83
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !85
  store i8* %1, i8** %data, align 8, !dbg !86
  %2 = load i8*, i8** %data, align 8, !dbg !87
  %3 = load i8*, i8** %data, align 8, !dbg !87
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !87
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !87
  %5 = load i8*, i8** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !90, metadata !DIExpression()), !dbg !92
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !92
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !93
  %7 = load i8*, i8** %data, align 8, !dbg !93
  %call1 = call i8* @__strcpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef 50) #5, !dbg !93
  %8 = load i8*, i8** %data, align 8, !dbg !94
  call void @printLine(i8* noundef %8), !dbg !95
  ret void, !dbg !96
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_15_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !3)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocation(line: 26, column: 33, scope: !13)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 10, scope: !13)
!25 = !DILocation(line: 32, column: 9, scope: !13)
!26 = !DILocation(line: 33, column: 9, scope: !13)
!27 = !DILocation(line: 33, column: 21, scope: !13)
!28 = !DILocalVariable(name: "dest", scope: !29, file: !14, line: 41, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 41, column: 14, scope: !29)
!34 = !DILocation(line: 43, column: 9, scope: !29)
!35 = !DILocation(line: 44, column: 19, scope: !29)
!36 = !DILocation(line: 44, column: 9, scope: !29)
!37 = !DILocation(line: 46, column: 1, scope: !13)
!38 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_15_good", scope: !14, file: !14, line: 104, type: !15, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!39 = !DILocation(line: 106, column: 5, scope: !38)
!40 = !DILocation(line: 107, column: 5, scope: !38)
!41 = !DILocation(line: 108, column: 1, scope: !38)
!42 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 120, type: !43, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!43 = !DISubroutineType(types: !44)
!44 = !{!45, !45, !46}
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !14, line: 120, type: !45)
!48 = !DILocation(line: 120, column: 14, scope: !42)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !14, line: 120, type: !46)
!50 = !DILocation(line: 120, column: 27, scope: !42)
!51 = !DILocation(line: 123, column: 22, scope: !42)
!52 = !DILocation(line: 123, column: 12, scope: !42)
!53 = !DILocation(line: 123, column: 5, scope: !42)
!54 = !DILocation(line: 125, column: 5, scope: !42)
!55 = !DILocation(line: 126, column: 5, scope: !42)
!56 = !DILocation(line: 127, column: 5, scope: !42)
!57 = !DILocation(line: 130, column: 5, scope: !42)
!58 = !DILocation(line: 131, column: 5, scope: !42)
!59 = !DILocation(line: 132, column: 5, scope: !42)
!60 = !DILocation(line: 134, column: 5, scope: !42)
!61 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!62 = !DILocalVariable(name: "data", scope: !61, file: !14, line: 55, type: !3)
!63 = !DILocation(line: 55, column: 12, scope: !61)
!64 = !DILocalVariable(name: "dataBuffer", scope: !61, file: !14, line: 56, type: !3)
!65 = !DILocation(line: 56, column: 12, scope: !61)
!66 = !DILocation(line: 56, column: 33, scope: !61)
!67 = !DILocation(line: 57, column: 12, scope: !61)
!68 = !DILocation(line: 57, column: 10, scope: !61)
!69 = !DILocation(line: 66, column: 9, scope: !61)
!70 = !DILocation(line: 67, column: 9, scope: !61)
!71 = !DILocation(line: 67, column: 20, scope: !61)
!72 = !DILocalVariable(name: "dest", scope: !73, file: !14, line: 71, type: !30)
!73 = distinct !DILexicalBlock(scope: !61, file: !14, line: 70, column: 5)
!74 = !DILocation(line: 71, column: 14, scope: !73)
!75 = !DILocation(line: 73, column: 9, scope: !73)
!76 = !DILocation(line: 74, column: 19, scope: !73)
!77 = !DILocation(line: 74, column: 9, scope: !73)
!78 = !DILocation(line: 76, column: 1, scope: !61)
!79 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 79, type: !15, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!80 = !DILocalVariable(name: "data", scope: !79, file: !14, line: 81, type: !3)
!81 = !DILocation(line: 81, column: 12, scope: !79)
!82 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !14, line: 82, type: !3)
!83 = !DILocation(line: 82, column: 12, scope: !79)
!84 = !DILocation(line: 82, column: 33, scope: !79)
!85 = !DILocation(line: 83, column: 12, scope: !79)
!86 = !DILocation(line: 83, column: 10, scope: !79)
!87 = !DILocation(line: 88, column: 9, scope: !79)
!88 = !DILocation(line: 89, column: 9, scope: !79)
!89 = !DILocation(line: 89, column: 20, scope: !79)
!90 = !DILocalVariable(name: "dest", scope: !91, file: !14, line: 97, type: !30)
!91 = distinct !DILexicalBlock(scope: !79, file: !14, line: 96, column: 5)
!92 = !DILocation(line: 97, column: 14, scope: !91)
!93 = !DILocation(line: 99, column: 9, scope: !91)
!94 = !DILocation(line: 100, column: 19, scope: !91)
!95 = !DILocation(line: 100, column: 9, scope: !91)
!96 = !DILocation(line: 102, column: 1, scope: !79)
