; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_06_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !30
  store i32* %arraydecay, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !34, metadata !DIExpression()), !dbg !36
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !36
  %1 = load i32*, i32** %data, align 8, !dbg !37
  %2 = bitcast i32* %1 to i8*, !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !37
  %3 = bitcast i32* %arraydecay1 to i8*, !dbg !37
  %4 = load i32*, i32** %data, align 8, !dbg !37
  %5 = bitcast i32* %4 to i8*, !dbg !37
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !37
  %call = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 400, i64 noundef %6) #5, !dbg !37
  %7 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !38
  %8 = load i32, i32* %arrayidx, align 4, !dbg !38
  call void @printIntLine(i32 noundef %8), !dbg !39
  ret void, !dbg !40
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_06_good() #0 !dbg !41 {
entry:
  call void @goodG2B1(), !dbg !42
  call void @goodG2B2(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* noundef null), !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 noundef %conv), !dbg !57
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_06_good(), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_06_bad(), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !65 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !72
  store i32* %arraydecay, i32** %data, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !76, metadata !DIExpression()), !dbg !78
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !78
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !78
  %1 = load i32*, i32** %data, align 8, !dbg !79
  %2 = bitcast i32* %1 to i8*, !dbg !79
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !79
  %3 = bitcast i32* %arraydecay1 to i8*, !dbg !79
  %4 = load i32*, i32** %data, align 8, !dbg !79
  %5 = bitcast i32* %4 to i8*, !dbg !79
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !79
  %call = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 400, i64 noundef %6) #5, !dbg !79
  %7 = load i32*, i32** %data, align 8, !dbg !80
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !80
  %8 = load i32, i32* %arrayidx, align 4, !dbg !80
  call void @printIntLine(i32 noundef %8), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !90
  store i32* %arraydecay, i32** %data, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !96
  %1 = load i32*, i32** %data, align 8, !dbg !97
  %2 = bitcast i32* %1 to i8*, !dbg !97
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !97
  %3 = bitcast i32* %arraydecay1 to i8*, !dbg !97
  %4 = load i32*, i32** %data, align 8, !dbg !97
  %5 = bitcast i32* %4 to i8*, !dbg !97
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !97
  %call = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 400, i64 noundef %6) #5, !dbg !97
  %7 = load i32*, i32** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !98
  %8 = load i32, i32* %arrayidx, align 4, !dbg !98
  call void @printIntLine(i32 noundef %8), !dbg !99
  ret void, !dbg !100
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_06_bad", scope: !12, file: !12, line: 25, type: !13, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 27, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 27, column: 11, scope: !11)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 28, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 28, column: 9, scope: !11)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 29, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 29, column: 9, scope: !11)
!30 = !DILocation(line: 34, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !12, line: 31, column: 5)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 8)
!33 = !DILocation(line: 34, column: 14, scope: !31)
!34 = !DILocalVariable(name: "source", scope: !35, file: !12, line: 37, type: !26)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 36, column: 5)
!36 = !DILocation(line: 37, column: 13, scope: !35)
!37 = !DILocation(line: 39, column: 9, scope: !35)
!38 = !DILocation(line: 40, column: 22, scope: !35)
!39 = !DILocation(line: 40, column: 9, scope: !35)
!40 = !DILocation(line: 42, column: 1, scope: !11)
!41 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_06_good", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!42 = !DILocation(line: 93, column: 5, scope: !41)
!43 = !DILocation(line: 94, column: 5, scope: !41)
!44 = !DILocation(line: 95, column: 1, scope: !41)
!45 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 107, type: !46, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!46 = !DISubroutineType(types: !47)
!47 = !{!18, !18, !48}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !12, line: 107, type: !18)
!52 = !DILocation(line: 107, column: 14, scope: !45)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !12, line: 107, type: !48)
!54 = !DILocation(line: 107, column: 27, scope: !45)
!55 = !DILocation(line: 110, column: 22, scope: !45)
!56 = !DILocation(line: 110, column: 12, scope: !45)
!57 = !DILocation(line: 110, column: 5, scope: !45)
!58 = !DILocation(line: 112, column: 5, scope: !45)
!59 = !DILocation(line: 113, column: 5, scope: !45)
!60 = !DILocation(line: 114, column: 5, scope: !45)
!61 = !DILocation(line: 117, column: 5, scope: !45)
!62 = !DILocation(line: 118, column: 5, scope: !45)
!63 = !DILocation(line: 119, column: 5, scope: !45)
!64 = !DILocation(line: 121, column: 5, scope: !45)
!65 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 49, type: !13, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!66 = !DILocalVariable(name: "data", scope: !65, file: !12, line: 51, type: !17)
!67 = !DILocation(line: 51, column: 11, scope: !65)
!68 = !DILocalVariable(name: "dataBadBuffer", scope: !65, file: !12, line: 52, type: !21)
!69 = !DILocation(line: 52, column: 9, scope: !65)
!70 = !DILocalVariable(name: "dataGoodBuffer", scope: !65, file: !12, line: 53, type: !26)
!71 = !DILocation(line: 53, column: 9, scope: !65)
!72 = !DILocation(line: 62, column: 16, scope: !73)
!73 = distinct !DILexicalBlock(scope: !74, file: !12, line: 60, column: 5)
!74 = distinct !DILexicalBlock(scope: !65, file: !12, line: 54, column: 8)
!75 = !DILocation(line: 62, column: 14, scope: !73)
!76 = !DILocalVariable(name: "source", scope: !77, file: !12, line: 65, type: !26)
!77 = distinct !DILexicalBlock(scope: !65, file: !12, line: 64, column: 5)
!78 = !DILocation(line: 65, column: 13, scope: !77)
!79 = !DILocation(line: 67, column: 9, scope: !77)
!80 = !DILocation(line: 68, column: 22, scope: !77)
!81 = !DILocation(line: 68, column: 9, scope: !77)
!82 = !DILocation(line: 70, column: 1, scope: !65)
!83 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!84 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 75, type: !17)
!85 = !DILocation(line: 75, column: 11, scope: !83)
!86 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !12, line: 76, type: !21)
!87 = !DILocation(line: 76, column: 9, scope: !83)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !12, line: 77, type: !26)
!89 = !DILocation(line: 77, column: 9, scope: !83)
!90 = !DILocation(line: 81, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !92, file: !12, line: 79, column: 5)
!92 = distinct !DILexicalBlock(scope: !83, file: !12, line: 78, column: 8)
!93 = !DILocation(line: 81, column: 14, scope: !91)
!94 = !DILocalVariable(name: "source", scope: !95, file: !12, line: 84, type: !26)
!95 = distinct !DILexicalBlock(scope: !83, file: !12, line: 83, column: 5)
!96 = !DILocation(line: 84, column: 13, scope: !95)
!97 = !DILocation(line: 86, column: 9, scope: !95)
!98 = !DILocation(line: 87, column: 22, scope: !95)
!99 = !DILocation(line: 87, column: 9, scope: !95)
!100 = !DILocation(line: 89, column: 1, scope: !83)
