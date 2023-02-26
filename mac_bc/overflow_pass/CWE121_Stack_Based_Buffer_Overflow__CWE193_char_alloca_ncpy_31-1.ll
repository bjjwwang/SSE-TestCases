; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_31_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_31_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 10, align 16, !dbg !22
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %1 = alloca i8, i64 11, align 16, !dbg !25
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !24
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !26
  store i8* %2, i8** %data, align 8, !dbg !27
  %3 = load i8*, i8** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !30, metadata !DIExpression()), !dbg !32
  %4 = load i8*, i8** %data, align 8, !dbg !33
  store i8* %4, i8** %dataCopy, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !34, metadata !DIExpression()), !dbg !35
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !36
  store i8* %5, i8** %data1, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_31_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !42
  %7 = load i8*, i8** %data1, align 8, !dbg !43
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !43
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !43
  %call = call i64 @strlen(i8* noundef %arraydecay2), !dbg !43
  %add = add i64 %call, 1, !dbg !43
  %8 = load i8*, i8** %data1, align 8, !dbg !43
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !43
  %call3 = call i8* @__strncpy_chk(i8* noundef %7, i8* noundef %arraydecay, i64 noundef %add, i64 noundef %9) #5, !dbg !43
  %10 = load i8*, i8** %data1, align 8, !dbg !44
  call void @printLine(i8* noundef %10), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_31_good() #0 !dbg !47 {
entry:
  call void @goodG2B(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* noundef null), !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 noundef %conv), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_31_good(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_31_bad(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !69 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = alloca i8, i64 10, align 16, !dbg !74
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %1 = alloca i8, i64 11, align 16, !dbg !77
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !76
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !78
  store i8* %2, i8** %data, align 8, !dbg !79
  %3 = load i8*, i8** %data, align 8, !dbg !80
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !80
  store i8 0, i8* %arrayidx, align 1, !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !82, metadata !DIExpression()), !dbg !84
  %4 = load i8*, i8** %data, align 8, !dbg !85
  store i8* %4, i8** %dataCopy, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !86, metadata !DIExpression()), !dbg !87
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !88
  store i8* %5, i8** %data1, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !89, metadata !DIExpression()), !dbg !91
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !91
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !91
  %7 = load i8*, i8** %data1, align 8, !dbg !92
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !92
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !92
  %call = call i64 @strlen(i8* noundef %arraydecay2), !dbg !92
  %add = add i64 %call, 1, !dbg !92
  %8 = load i8*, i8** %data1, align 8, !dbg !92
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !92
  %call3 = call i8* @__strncpy_chk(i8* noundef %7, i8* noundef %arraydecay, i64 noundef %add, i64 noundef %9) #5, !dbg !92
  %10 = load i8*, i8** %data1, align 8, !dbg !93
  call void @printLine(i8* noundef %10), !dbg !94
  ret void, !dbg !95
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_31_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !3)
!19 = !DILocation(line: 30, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 31, type: !3)
!21 = !DILocation(line: 31, column: 12, scope: !13)
!22 = !DILocation(line: 31, column: 36, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 32, type: !3)
!24 = !DILocation(line: 32, column: 12, scope: !13)
!25 = !DILocation(line: 32, column: 37, scope: !13)
!26 = !DILocation(line: 35, column: 12, scope: !13)
!27 = !DILocation(line: 35, column: 10, scope: !13)
!28 = !DILocation(line: 36, column: 5, scope: !13)
!29 = !DILocation(line: 36, column: 13, scope: !13)
!30 = !DILocalVariable(name: "dataCopy", scope: !31, file: !14, line: 38, type: !3)
!31 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!32 = !DILocation(line: 38, column: 16, scope: !31)
!33 = !DILocation(line: 38, column: 27, scope: !31)
!34 = !DILocalVariable(name: "data", scope: !31, file: !14, line: 39, type: !3)
!35 = !DILocation(line: 39, column: 16, scope: !31)
!36 = !DILocation(line: 39, column: 23, scope: !31)
!37 = !DILocalVariable(name: "source", scope: !38, file: !14, line: 41, type: !39)
!38 = distinct !DILexicalBlock(scope: !31, file: !14, line: 40, column: 9)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 11)
!42 = !DILocation(line: 41, column: 18, scope: !38)
!43 = !DILocation(line: 44, column: 13, scope: !38)
!44 = !DILocation(line: 45, column: 23, scope: !38)
!45 = !DILocation(line: 45, column: 13, scope: !38)
!46 = !DILocation(line: 48, column: 1, scope: !13)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_31_good", scope: !14, file: !14, line: 77, type: !15, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!48 = !DILocation(line: 79, column: 5, scope: !47)
!49 = !DILocation(line: 80, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 91, type: !51, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !14, line: 91, type: !53)
!56 = !DILocation(line: 91, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !14, line: 91, type: !54)
!58 = !DILocation(line: 91, column: 27, scope: !50)
!59 = !DILocation(line: 94, column: 22, scope: !50)
!60 = !DILocation(line: 94, column: 12, scope: !50)
!61 = !DILocation(line: 94, column: 5, scope: !50)
!62 = !DILocation(line: 96, column: 5, scope: !50)
!63 = !DILocation(line: 97, column: 5, scope: !50)
!64 = !DILocation(line: 98, column: 5, scope: !50)
!65 = !DILocation(line: 101, column: 5, scope: !50)
!66 = !DILocation(line: 102, column: 5, scope: !50)
!67 = !DILocation(line: 103, column: 5, scope: !50)
!68 = !DILocation(line: 105, column: 5, scope: !50)
!69 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!70 = !DILocalVariable(name: "data", scope: !69, file: !14, line: 57, type: !3)
!71 = !DILocation(line: 57, column: 12, scope: !69)
!72 = !DILocalVariable(name: "dataBadBuffer", scope: !69, file: !14, line: 58, type: !3)
!73 = !DILocation(line: 58, column: 12, scope: !69)
!74 = !DILocation(line: 58, column: 36, scope: !69)
!75 = !DILocalVariable(name: "dataGoodBuffer", scope: !69, file: !14, line: 59, type: !3)
!76 = !DILocation(line: 59, column: 12, scope: !69)
!77 = !DILocation(line: 59, column: 37, scope: !69)
!78 = !DILocation(line: 62, column: 12, scope: !69)
!79 = !DILocation(line: 62, column: 10, scope: !69)
!80 = !DILocation(line: 63, column: 5, scope: !69)
!81 = !DILocation(line: 63, column: 13, scope: !69)
!82 = !DILocalVariable(name: "dataCopy", scope: !83, file: !14, line: 65, type: !3)
!83 = distinct !DILexicalBlock(scope: !69, file: !14, line: 64, column: 5)
!84 = !DILocation(line: 65, column: 16, scope: !83)
!85 = !DILocation(line: 65, column: 27, scope: !83)
!86 = !DILocalVariable(name: "data", scope: !83, file: !14, line: 66, type: !3)
!87 = !DILocation(line: 66, column: 16, scope: !83)
!88 = !DILocation(line: 66, column: 23, scope: !83)
!89 = !DILocalVariable(name: "source", scope: !90, file: !14, line: 68, type: !39)
!90 = distinct !DILexicalBlock(scope: !83, file: !14, line: 67, column: 9)
!91 = !DILocation(line: 68, column: 18, scope: !90)
!92 = !DILocation(line: 71, column: 13, scope: !90)
!93 = !DILocation(line: 72, column: 23, scope: !90)
!94 = !DILocation(line: 72, column: 13, scope: !90)
!95 = !DILocation(line: 75, column: 1, scope: !69)
