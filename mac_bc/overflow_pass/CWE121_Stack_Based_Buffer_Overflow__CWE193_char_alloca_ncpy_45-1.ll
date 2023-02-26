; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_goodG2BData = internal global i8* null, align 8, !dbg !9
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 10, align 16, !dbg !27
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %1 = alloca i8, i64 11, align 16, !dbg !30
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !29
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !31
  store i8* %2, i8** %data, align 8, !dbg !32
  %3 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %4 = load i8*, i8** %data, align 8, !dbg !35
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_badData, align 8, !dbg !36
  call void @badSink(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_good() #0 !dbg !39 {
entry:
  call void @goodG2B(), !dbg !40
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_good(), !dbg !55
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_bad(), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !59
  ret i32 0, !dbg !60
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !61 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_badData, align 8, !dbg !64
  store i8* %0, i8** %data, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !65, metadata !DIExpression()), !dbg !70
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !70
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !70
  %2 = load i8*, i8** %data, align 8, !dbg !71
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !71
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !71
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !71
  %add = add i64 %call, 1, !dbg !71
  %3 = load i8*, i8** %data, align 8, !dbg !71
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !71
  %call2 = call i8* @__strncpy_chk(i8* noundef %2, i8* noundef %arraydecay, i64 noundef %add, i64 noundef %4) #5, !dbg !71
  %5 = load i8*, i8** %data, align 8, !dbg !72
  call void @printLine(i8* noundef %5), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @strlen(i8* noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = alloca i8, i64 10, align 16, !dbg !80
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %1 = alloca i8, i64 11, align 16, !dbg !83
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !82
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !84
  store i8* %2, i8** %data, align 8, !dbg !85
  %3 = load i8*, i8** %data, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !86
  store i8 0, i8* %arrayidx, align 1, !dbg !87
  %4 = load i8*, i8** %data, align 8, !dbg !88
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_goodG2BData, align 8, !dbg !89
  call void @goodG2BSink(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_goodG2BData, align 8, !dbg !95
  store i8* %0, i8** %data, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !98
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !98
  %2 = load i8*, i8** %data, align 8, !dbg !99
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !99
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !99
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !99
  %add = add i64 %call, 1, !dbg !99
  %3 = load i8*, i8** %data, align 8, !dbg !99
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !99
  %call2 = call i8* @__strncpy_chk(i8* noundef %2, i8* noundef %arraydecay, i64 noundef %add, i64 noundef %4) #5, !dbg !99
  %5 = load i8*, i8** %data, align 8, !dbg !100
  call void @printLine(i8* noundef %5), !dbg !101
  ret void, !dbg !102
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_badData", scope: !2, file: !11, line: 26, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_goodG2BData", scope: !2, file: !11, line: 27, type: !5, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Homebrew clang version 14.0.6"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_bad", scope: !11, file: !11, line: 43, type: !20, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 45, type: !5)
!24 = !DILocation(line: 45, column: 12, scope: !19)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !11, line: 46, type: !5)
!26 = !DILocation(line: 46, column: 12, scope: !19)
!27 = !DILocation(line: 46, column: 36, scope: !19)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !11, line: 47, type: !5)
!29 = !DILocation(line: 47, column: 12, scope: !19)
!30 = !DILocation(line: 47, column: 37, scope: !19)
!31 = !DILocation(line: 50, column: 12, scope: !19)
!32 = !DILocation(line: 50, column: 10, scope: !19)
!33 = !DILocation(line: 51, column: 5, scope: !19)
!34 = !DILocation(line: 51, column: 13, scope: !19)
!35 = !DILocation(line: 52, column: 78, scope: !19)
!36 = !DILocation(line: 52, column: 76, scope: !19)
!37 = !DILocation(line: 53, column: 5, scope: !19)
!38 = !DILocation(line: 54, column: 1, scope: !19)
!39 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_good", scope: !11, file: !11, line: 86, type: !20, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!40 = !DILocation(line: 88, column: 5, scope: !39)
!41 = !DILocation(line: 89, column: 1, scope: !39)
!42 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 100, type: !43, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!43 = !DISubroutineType(types: !44)
!44 = !{!45, !45, !46}
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !11, line: 100, type: !45)
!48 = !DILocation(line: 100, column: 14, scope: !42)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !11, line: 100, type: !46)
!50 = !DILocation(line: 100, column: 27, scope: !42)
!51 = !DILocation(line: 103, column: 22, scope: !42)
!52 = !DILocation(line: 103, column: 12, scope: !42)
!53 = !DILocation(line: 103, column: 5, scope: !42)
!54 = !DILocation(line: 105, column: 5, scope: !42)
!55 = !DILocation(line: 106, column: 5, scope: !42)
!56 = !DILocation(line: 107, column: 5, scope: !42)
!57 = !DILocation(line: 110, column: 5, scope: !42)
!58 = !DILocation(line: 111, column: 5, scope: !42)
!59 = !DILocation(line: 112, column: 5, scope: !42)
!60 = !DILocation(line: 114, column: 5, scope: !42)
!61 = distinct !DISubprogram(name: "badSink", scope: !11, file: !11, line: 31, type: !20, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!62 = !DILocalVariable(name: "data", scope: !61, file: !11, line: 33, type: !5)
!63 = !DILocation(line: 33, column: 12, scope: !61)
!64 = !DILocation(line: 33, column: 19, scope: !61)
!65 = !DILocalVariable(name: "source", scope: !66, file: !11, line: 35, type: !67)
!66 = distinct !DILexicalBlock(scope: !61, file: !11, line: 34, column: 5)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 88, elements: !68)
!68 = !{!69}
!69 = !DISubrange(count: 11)
!70 = !DILocation(line: 35, column: 14, scope: !66)
!71 = !DILocation(line: 38, column: 9, scope: !66)
!72 = !DILocation(line: 39, column: 19, scope: !66)
!73 = !DILocation(line: 39, column: 9, scope: !66)
!74 = !DILocation(line: 41, column: 1, scope: !61)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !11, file: !11, line: 73, type: !20, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!76 = !DILocalVariable(name: "data", scope: !75, file: !11, line: 75, type: !5)
!77 = !DILocation(line: 75, column: 12, scope: !75)
!78 = !DILocalVariable(name: "dataBadBuffer", scope: !75, file: !11, line: 76, type: !5)
!79 = !DILocation(line: 76, column: 12, scope: !75)
!80 = !DILocation(line: 76, column: 36, scope: !75)
!81 = !DILocalVariable(name: "dataGoodBuffer", scope: !75, file: !11, line: 77, type: !5)
!82 = !DILocation(line: 77, column: 12, scope: !75)
!83 = !DILocation(line: 77, column: 37, scope: !75)
!84 = !DILocation(line: 80, column: 12, scope: !75)
!85 = !DILocation(line: 80, column: 10, scope: !75)
!86 = !DILocation(line: 81, column: 5, scope: !75)
!87 = !DILocation(line: 81, column: 13, scope: !75)
!88 = !DILocation(line: 82, column: 82, scope: !75)
!89 = !DILocation(line: 82, column: 80, scope: !75)
!90 = !DILocation(line: 83, column: 5, scope: !75)
!91 = !DILocation(line: 84, column: 1, scope: !75)
!92 = distinct !DISubprogram(name: "goodG2BSink", scope: !11, file: !11, line: 61, type: !20, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!93 = !DILocalVariable(name: "data", scope: !92, file: !11, line: 63, type: !5)
!94 = !DILocation(line: 63, column: 12, scope: !92)
!95 = !DILocation(line: 63, column: 19, scope: !92)
!96 = !DILocalVariable(name: "source", scope: !97, file: !11, line: 65, type: !67)
!97 = distinct !DILexicalBlock(scope: !92, file: !11, line: 64, column: 5)
!98 = !DILocation(line: 65, column: 14, scope: !97)
!99 = !DILocation(line: 68, column: 9, scope: !97)
!100 = !DILocation(line: 69, column: 19, scope: !97)
!101 = !DILocation(line: 69, column: 9, scope: !97)
!102 = !DILocation(line: 71, column: 1, scope: !92)
