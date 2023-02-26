; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !20, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !29
  store i8* %arraydecay, i8** %data, align 8, !dbg !30
  %0 = load i32, i32* @staticFive, align 4, !dbg !31
  %cmp = icmp eq i32 %0, 5, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !35
  %2 = load i8*, i8** %data, align 8, !dbg !35
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !35
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #5, !dbg !35
  %4 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !45
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !46
  %6 = load i8*, i8** %data, align 8, !dbg !46
  %call2 = call i8* @__strcpy_chk(i8* noundef %arraydecay1, i8* noundef %6, i64 noundef 50) #5, !dbg !46
  %7 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* noundef %7), !dbg !48
  ret void, !dbg !49
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
define void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_07_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* noundef null), !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 noundef %conv), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_07_good(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_07_bad(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !77
  store i8* %arraydecay, i8** %data, align 8, !dbg !78
  %0 = load i32, i32* @staticFive, align 4, !dbg !79
  %cmp = icmp ne i32 %0, 5, !dbg !81
  br i1 %cmp, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  br label %if.end, !dbg !85

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !86
  %2 = load i8*, i8** %data, align 8, !dbg !86
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !86
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #5, !dbg !86
  %4 = load i8*, i8** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !90, metadata !DIExpression()), !dbg !92
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !92
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !93
  %6 = load i8*, i8** %data, align 8, !dbg !93
  %call2 = call i8* @__strcpy_chk(i8* noundef %arraydecay1, i8* noundef %6, i64 noundef 50) #5, !dbg !93
  %7 = load i8*, i8** %data, align 8, !dbg !94
  call void @printLine(i8* noundef %7), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !102
  store i8* %arraydecay, i8** %data, align 8, !dbg !103
  %0 = load i32, i32* @staticFive, align 4, !dbg !104
  %cmp = icmp eq i32 %0, 5, !dbg !106
  br i1 %cmp, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !108
  %2 = load i8*, i8** %data, align 8, !dbg !108
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !108
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #5, !dbg !108
  %4 = load i8*, i8** %data, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !110
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  br label %if.end, !dbg !112

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !115
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !116
  %6 = load i8*, i8** %data, align 8, !dbg !116
  %call2 = call i8* @__strcpy_chk(i8* noundef %arraydecay1, i8* noundef %6, i64 noundef 50) #5, !dbg !116
  %7 = load i8*, i8** %data, align 8, !dbg !117
  call void @printLine(i8* noundef %7), !dbg !118
  ret void, !dbg !119
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !7, line: 25, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0}
!7 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"Homebrew clang version 14.0.6"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_07_bad", scope: !7, file: !7, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !7, line: 31, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!23 = !DILocation(line: 31, column: 12, scope: !16)
!24 = !DILocalVariable(name: "dataBuffer", scope: !16, file: !7, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 32, column: 10, scope: !16)
!29 = !DILocation(line: 33, column: 12, scope: !16)
!30 = !DILocation(line: 33, column: 10, scope: !16)
!31 = !DILocation(line: 34, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !7, line: 34, column: 8)
!33 = !DILocation(line: 34, column: 18, scope: !32)
!34 = !DILocation(line: 34, column: 8, scope: !16)
!35 = !DILocation(line: 37, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !7, line: 35, column: 5)
!37 = !DILocation(line: 38, column: 9, scope: !36)
!38 = !DILocation(line: 38, column: 21, scope: !36)
!39 = !DILocation(line: 39, column: 5, scope: !36)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !7, line: 41, type: !42)
!41 = distinct !DILexicalBlock(scope: !16, file: !7, line: 40, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 400, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 41, column: 14, scope: !41)
!46 = !DILocation(line: 43, column: 9, scope: !41)
!47 = !DILocation(line: 44, column: 19, scope: !41)
!48 = !DILocation(line: 44, column: 9, scope: !41)
!49 = !DILocation(line: 46, column: 1, scope: !16)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_07_good", scope: !7, file: !7, line: 97, type: !17, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!51 = !DILocation(line: 99, column: 5, scope: !50)
!52 = !DILocation(line: 100, column: 5, scope: !50)
!53 = !DILocation(line: 101, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 113, type: !55, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!55 = !DISubroutineType(types: !56)
!56 = !{!8, !8, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !7, line: 113, type: !8)
!59 = !DILocation(line: 113, column: 14, scope: !54)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !7, line: 113, type: !57)
!61 = !DILocation(line: 113, column: 27, scope: !54)
!62 = !DILocation(line: 116, column: 22, scope: !54)
!63 = !DILocation(line: 116, column: 12, scope: !54)
!64 = !DILocation(line: 116, column: 5, scope: !54)
!65 = !DILocation(line: 118, column: 5, scope: !54)
!66 = !DILocation(line: 119, column: 5, scope: !54)
!67 = !DILocation(line: 120, column: 5, scope: !54)
!68 = !DILocation(line: 123, column: 5, scope: !54)
!69 = !DILocation(line: 124, column: 5, scope: !54)
!70 = !DILocation(line: 125, column: 5, scope: !54)
!71 = !DILocation(line: 127, column: 5, scope: !54)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !7, file: !7, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!73 = !DILocalVariable(name: "data", scope: !72, file: !7, line: 55, type: !21)
!74 = !DILocation(line: 55, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !7, line: 56, type: !25)
!76 = !DILocation(line: 56, column: 10, scope: !72)
!77 = !DILocation(line: 57, column: 12, scope: !72)
!78 = !DILocation(line: 57, column: 10, scope: !72)
!79 = !DILocation(line: 58, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !72, file: !7, line: 58, column: 8)
!81 = !DILocation(line: 58, column: 18, scope: !80)
!82 = !DILocation(line: 58, column: 8, scope: !72)
!83 = !DILocation(line: 61, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !7, line: 59, column: 5)
!85 = !DILocation(line: 62, column: 5, scope: !84)
!86 = !DILocation(line: 66, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !80, file: !7, line: 64, column: 5)
!88 = !DILocation(line: 67, column: 9, scope: !87)
!89 = !DILocation(line: 67, column: 20, scope: !87)
!90 = !DILocalVariable(name: "dest", scope: !91, file: !7, line: 70, type: !42)
!91 = distinct !DILexicalBlock(scope: !72, file: !7, line: 69, column: 5)
!92 = !DILocation(line: 70, column: 14, scope: !91)
!93 = !DILocation(line: 72, column: 9, scope: !91)
!94 = !DILocation(line: 73, column: 19, scope: !91)
!95 = !DILocation(line: 73, column: 9, scope: !91)
!96 = !DILocation(line: 75, column: 1, scope: !72)
!97 = distinct !DISubprogram(name: "goodG2B2", scope: !7, file: !7, line: 78, type: !17, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!98 = !DILocalVariable(name: "data", scope: !97, file: !7, line: 80, type: !21)
!99 = !DILocation(line: 80, column: 12, scope: !97)
!100 = !DILocalVariable(name: "dataBuffer", scope: !97, file: !7, line: 81, type: !25)
!101 = !DILocation(line: 81, column: 10, scope: !97)
!102 = !DILocation(line: 82, column: 12, scope: !97)
!103 = !DILocation(line: 82, column: 10, scope: !97)
!104 = !DILocation(line: 83, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !97, file: !7, line: 83, column: 8)
!106 = !DILocation(line: 83, column: 18, scope: !105)
!107 = !DILocation(line: 83, column: 8, scope: !97)
!108 = !DILocation(line: 86, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !7, line: 84, column: 5)
!110 = !DILocation(line: 87, column: 9, scope: !109)
!111 = !DILocation(line: 87, column: 20, scope: !109)
!112 = !DILocation(line: 88, column: 5, scope: !109)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !7, line: 90, type: !42)
!114 = distinct !DILexicalBlock(scope: !97, file: !7, line: 89, column: 5)
!115 = !DILocation(line: 90, column: 14, scope: !114)
!116 = !DILocation(line: 92, column: 9, scope: !114)
!117 = !DILocation(line: 93, column: 19, scope: !114)
!118 = !DILocation(line: 93, column: 9, scope: !114)
!119 = !DILocation(line: 95, column: 1, scope: !97)
