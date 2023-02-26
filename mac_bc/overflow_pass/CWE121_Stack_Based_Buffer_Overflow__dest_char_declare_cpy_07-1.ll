; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !20, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %0 = load i32, i32* @staticFive, align 4, !dbg !34
  %cmp = icmp eq i32 %0, 5, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i8* %arraydecay, i8** %data, align 8, !dbg !40
  %1 = load i8*, i8** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !44, metadata !DIExpression()), !dbg !46
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !47
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx2, align 1, !dbg !49
  %2 = load i8*, i8** %data, align 8, !dbg !50
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !50
  %3 = load i8*, i8** %data, align 8, !dbg !50
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !50
  %call = call i8* @__strcpy_chk(i8* noundef %2, i8* noundef %arraydecay3, i64 noundef %4) #5, !dbg !50
  %5 = load i8*, i8** %data, align 8, !dbg !51
  call void @printLine(i8* noundef %5), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_07_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !58 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_07_good(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_07_bad(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = load i32, i32* @staticFive, align 4, !dbg !83
  %cmp = icmp ne i32 %0, 5, !dbg !85
  br i1 %cmp, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !87
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !90
  store i8* %arraydecay, i8** %data, align 8, !dbg !92
  %1 = load i8*, i8** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !93
  store i8 0, i8* %arrayidx, align 1, !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !95, metadata !DIExpression()), !dbg !97
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !98
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !99
  store i8 0, i8* %arrayidx2, align 1, !dbg !100
  %2 = load i8*, i8** %data, align 8, !dbg !101
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !101
  %3 = load i8*, i8** %data, align 8, !dbg !101
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !101
  %call = call i8* @__strcpy_chk(i8* noundef %2, i8* noundef %arraydecay3, i64 noundef %4) #5, !dbg !101
  %5 = load i8*, i8** %data, align 8, !dbg !102
  call void @printLine(i8* noundef %5), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !105 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = load i32, i32* @staticFive, align 4, !dbg !112
  %cmp = icmp eq i32 %0, 5, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !116
  store i8* %arraydecay, i8** %data, align 8, !dbg !118
  %1 = load i8*, i8** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  br label %if.end, !dbg !121

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !125
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !126
  store i8 0, i8* %arrayidx2, align 1, !dbg !127
  %2 = load i8*, i8** %data, align 8, !dbg !128
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !128
  %3 = load i8*, i8** %data, align 8, !dbg !128
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !128
  %call = call i8* @__strcpy_chk(i8* noundef %2, i8* noundef %arraydecay3, i64 noundef %4) #5, !dbg !128
  %5 = load i8*, i8** %data, align 8, !dbg !129
  call void @printLine(i8* noundef %5), !dbg !130
  ret void, !dbg !131
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !7, line: 25, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0}
!7 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"Homebrew clang version 14.0.6"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_07_bad", scope: !7, file: !7, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !7, line: 31, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!23 = !DILocation(line: 31, column: 12, scope: !16)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !7, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 32, column: 10, scope: !16)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !7, line: 33, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 800, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 33, column: 10, scope: !16)
!34 = !DILocation(line: 34, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !16, file: !7, line: 34, column: 8)
!36 = !DILocation(line: 34, column: 18, scope: !35)
!37 = !DILocation(line: 34, column: 8, scope: !16)
!38 = !DILocation(line: 38, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !7, line: 35, column: 5)
!40 = !DILocation(line: 38, column: 14, scope: !39)
!41 = !DILocation(line: 39, column: 9, scope: !39)
!42 = !DILocation(line: 39, column: 17, scope: !39)
!43 = !DILocation(line: 40, column: 5, scope: !39)
!44 = !DILocalVariable(name: "source", scope: !45, file: !7, line: 42, type: !30)
!45 = distinct !DILexicalBlock(scope: !16, file: !7, line: 41, column: 5)
!46 = !DILocation(line: 42, column: 14, scope: !45)
!47 = !DILocation(line: 43, column: 9, scope: !45)
!48 = !DILocation(line: 44, column: 9, scope: !45)
!49 = !DILocation(line: 44, column: 23, scope: !45)
!50 = !DILocation(line: 46, column: 9, scope: !45)
!51 = !DILocation(line: 47, column: 19, scope: !45)
!52 = !DILocation(line: 47, column: 9, scope: !45)
!53 = !DILocation(line: 49, column: 1, scope: !16)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_07_good", scope: !7, file: !7, line: 104, type: !17, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!55 = !DILocation(line: 106, column: 5, scope: !54)
!56 = !DILocation(line: 107, column: 5, scope: !54)
!57 = !DILocation(line: 108, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 120, type: !59, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!59 = !DISubroutineType(types: !60)
!60 = !{!8, !8, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !7, line: 120, type: !8)
!63 = !DILocation(line: 120, column: 14, scope: !58)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !7, line: 120, type: !61)
!65 = !DILocation(line: 120, column: 27, scope: !58)
!66 = !DILocation(line: 123, column: 22, scope: !58)
!67 = !DILocation(line: 123, column: 12, scope: !58)
!68 = !DILocation(line: 123, column: 5, scope: !58)
!69 = !DILocation(line: 125, column: 5, scope: !58)
!70 = !DILocation(line: 126, column: 5, scope: !58)
!71 = !DILocation(line: 127, column: 5, scope: !58)
!72 = !DILocation(line: 130, column: 5, scope: !58)
!73 = !DILocation(line: 131, column: 5, scope: !58)
!74 = !DILocation(line: 132, column: 5, scope: !58)
!75 = !DILocation(line: 134, column: 5, scope: !58)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !7, file: !7, line: 56, type: !17, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!77 = !DILocalVariable(name: "data", scope: !76, file: !7, line: 58, type: !21)
!78 = !DILocation(line: 58, column: 12, scope: !76)
!79 = !DILocalVariable(name: "dataBadBuffer", scope: !76, file: !7, line: 59, type: !25)
!80 = !DILocation(line: 59, column: 10, scope: !76)
!81 = !DILocalVariable(name: "dataGoodBuffer", scope: !76, file: !7, line: 60, type: !30)
!82 = !DILocation(line: 60, column: 10, scope: !76)
!83 = !DILocation(line: 61, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !76, file: !7, line: 61, column: 8)
!85 = !DILocation(line: 61, column: 18, scope: !84)
!86 = !DILocation(line: 61, column: 8, scope: !76)
!87 = !DILocation(line: 64, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !7, line: 62, column: 5)
!89 = !DILocation(line: 65, column: 5, scope: !88)
!90 = !DILocation(line: 69, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !7, line: 67, column: 5)
!92 = !DILocation(line: 69, column: 14, scope: !91)
!93 = !DILocation(line: 70, column: 9, scope: !91)
!94 = !DILocation(line: 70, column: 17, scope: !91)
!95 = !DILocalVariable(name: "source", scope: !96, file: !7, line: 73, type: !30)
!96 = distinct !DILexicalBlock(scope: !76, file: !7, line: 72, column: 5)
!97 = !DILocation(line: 73, column: 14, scope: !96)
!98 = !DILocation(line: 74, column: 9, scope: !96)
!99 = !DILocation(line: 75, column: 9, scope: !96)
!100 = !DILocation(line: 75, column: 23, scope: !96)
!101 = !DILocation(line: 77, column: 9, scope: !96)
!102 = !DILocation(line: 78, column: 19, scope: !96)
!103 = !DILocation(line: 78, column: 9, scope: !96)
!104 = !DILocation(line: 80, column: 1, scope: !76)
!105 = distinct !DISubprogram(name: "goodG2B2", scope: !7, file: !7, line: 83, type: !17, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!106 = !DILocalVariable(name: "data", scope: !105, file: !7, line: 85, type: !21)
!107 = !DILocation(line: 85, column: 12, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !7, line: 86, type: !25)
!109 = !DILocation(line: 86, column: 10, scope: !105)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !7, line: 87, type: !30)
!111 = !DILocation(line: 87, column: 10, scope: !105)
!112 = !DILocation(line: 88, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !105, file: !7, line: 88, column: 8)
!114 = !DILocation(line: 88, column: 18, scope: !113)
!115 = !DILocation(line: 88, column: 8, scope: !105)
!116 = !DILocation(line: 91, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !7, line: 89, column: 5)
!118 = !DILocation(line: 91, column: 14, scope: !117)
!119 = !DILocation(line: 92, column: 9, scope: !117)
!120 = !DILocation(line: 92, column: 17, scope: !117)
!121 = !DILocation(line: 93, column: 5, scope: !117)
!122 = !DILocalVariable(name: "source", scope: !123, file: !7, line: 95, type: !30)
!123 = distinct !DILexicalBlock(scope: !105, file: !7, line: 94, column: 5)
!124 = !DILocation(line: 95, column: 14, scope: !123)
!125 = !DILocation(line: 96, column: 9, scope: !123)
!126 = !DILocation(line: 97, column: 9, scope: !123)
!127 = !DILocation(line: 97, column: 23, scope: !123)
!128 = !DILocation(line: 99, column: 9, scope: !123)
!129 = !DILocation(line: 100, column: 19, scope: !123)
!130 = !DILocation(line: 100, column: 9, scope: !123)
!131 = !DILocation(line: 102, column: 1, scope: !105)
