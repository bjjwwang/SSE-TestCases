; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 100, align 16, !dbg !26
  store i8* %0, i8** %dataBuffer, align 8, !dbg !25
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  store i8* %1, i8** %data, align 8, !dbg !28
  %2 = load i32, i32* @staticFive, align 4, !dbg !29
  %cmp = icmp eq i32 %2, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !33
  %4 = load i8*, i8** %data, align 8, !dbg !33
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !33
  %call = call i8* @__memset_chk(i8* noundef %3, i32 noundef 65, i64 noundef 99, i64 noundef %5) #5, !dbg !33
  %6 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %7 = bitcast [50 x i8]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 50, i1 false), !dbg !43
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !44
  %8 = load i8*, i8** %data, align 8, !dbg !44
  %call1 = call i8* @__strcpy_chk(i8* noundef %arraydecay, i8* noundef %8, i64 noundef 50) #5, !dbg !44
  %9 = load i8*, i8** %data, align 8, !dbg !45
  call void @printLine(i8* noundef %9), !dbg !46
  ret void, !dbg !47
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
define void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_07_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* noundef null), !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 noundef %conv), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_07_good(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_07_bad(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !70 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = alloca i8, i64 100, align 16, !dbg !75
  store i8* %0, i8** %dataBuffer, align 8, !dbg !74
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !76
  store i8* %1, i8** %data, align 8, !dbg !77
  %2 = load i32, i32* @staticFive, align 4, !dbg !78
  %cmp = icmp ne i32 %2, 5, !dbg !80
  br i1 %cmp, label %if.then, label %if.else, !dbg !81

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !82
  br label %if.end, !dbg !84

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !85
  %4 = load i8*, i8** %data, align 8, !dbg !85
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !85
  %call = call i8* @__memset_chk(i8* noundef %3, i32 noundef 65, i64 noundef 49, i64 noundef %5) #5, !dbg !85
  %6 = load i8*, i8** %data, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 49, !dbg !87
  store i8 0, i8* %arrayidx, align 1, !dbg !88
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !89, metadata !DIExpression()), !dbg !91
  %7 = bitcast [50 x i8]* %dest to i8*, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 50, i1 false), !dbg !91
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !92
  %8 = load i8*, i8** %data, align 8, !dbg !92
  %call1 = call i8* @__strcpy_chk(i8* noundef %arraydecay, i8* noundef %8, i64 noundef 50) #5, !dbg !92
  %9 = load i8*, i8** %data, align 8, !dbg !93
  call void @printLine(i8* noundef %9), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = alloca i8, i64 100, align 16, !dbg !101
  store i8* %0, i8** %dataBuffer, align 8, !dbg !100
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !102
  store i8* %1, i8** %data, align 8, !dbg !103
  %2 = load i32, i32* @staticFive, align 4, !dbg !104
  %cmp = icmp eq i32 %2, 5, !dbg !106
  br i1 %cmp, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !108
  %4 = load i8*, i8** %data, align 8, !dbg !108
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !108
  %call = call i8* @__memset_chk(i8* noundef %3, i32 noundef 65, i64 noundef 49, i64 noundef %5) #5, !dbg !108
  %6 = load i8*, i8** %data, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 49, !dbg !110
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  br label %if.end, !dbg !112

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %7 = bitcast [50 x i8]* %dest to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 50, i1 false), !dbg !115
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !116
  %8 = load i8*, i8** %data, align 8, !dbg !116
  %call1 = call i8* @__strcpy_chk(i8* noundef %arraydecay, i8* noundef %8, i64 noundef 50) #5, !dbg !116
  %9 = load i8*, i8** %data, align 8, !dbg !117
  call void @printLine(i8* noundef %9), !dbg !118
  ret void, !dbg !119
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !9, line: 25, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0}
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_07_bad", scope: !9, file: !9, line: 29, type: !19, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !9, line: 31, type: !5)
!23 = !DILocation(line: 31, column: 12, scope: !18)
!24 = !DILocalVariable(name: "dataBuffer", scope: !18, file: !9, line: 32, type: !5)
!25 = !DILocation(line: 32, column: 12, scope: !18)
!26 = !DILocation(line: 32, column: 33, scope: !18)
!27 = !DILocation(line: 33, column: 12, scope: !18)
!28 = !DILocation(line: 33, column: 10, scope: !18)
!29 = !DILocation(line: 34, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !18, file: !9, line: 34, column: 8)
!31 = !DILocation(line: 34, column: 18, scope: !30)
!32 = !DILocation(line: 34, column: 8, scope: !18)
!33 = !DILocation(line: 37, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !9, line: 35, column: 5)
!35 = !DILocation(line: 38, column: 9, scope: !34)
!36 = !DILocation(line: 38, column: 21, scope: !34)
!37 = !DILocation(line: 39, column: 5, scope: !34)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !9, line: 41, type: !40)
!39 = distinct !DILexicalBlock(scope: !18, file: !9, line: 40, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 41, column: 14, scope: !39)
!44 = !DILocation(line: 43, column: 9, scope: !39)
!45 = !DILocation(line: 44, column: 19, scope: !39)
!46 = !DILocation(line: 44, column: 9, scope: !39)
!47 = !DILocation(line: 46, column: 1, scope: !18)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_07_good", scope: !9, file: !9, line: 97, type: !19, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!49 = !DILocation(line: 99, column: 5, scope: !48)
!50 = !DILocation(line: 100, column: 5, scope: !48)
!51 = !DILocation(line: 101, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 113, type: !53, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!53 = !DISubroutineType(types: !54)
!54 = !{!10, !10, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !9, line: 113, type: !10)
!57 = !DILocation(line: 113, column: 14, scope: !52)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !9, line: 113, type: !55)
!59 = !DILocation(line: 113, column: 27, scope: !52)
!60 = !DILocation(line: 116, column: 22, scope: !52)
!61 = !DILocation(line: 116, column: 12, scope: !52)
!62 = !DILocation(line: 116, column: 5, scope: !52)
!63 = !DILocation(line: 118, column: 5, scope: !52)
!64 = !DILocation(line: 119, column: 5, scope: !52)
!65 = !DILocation(line: 120, column: 5, scope: !52)
!66 = !DILocation(line: 123, column: 5, scope: !52)
!67 = !DILocation(line: 124, column: 5, scope: !52)
!68 = !DILocation(line: 125, column: 5, scope: !52)
!69 = !DILocation(line: 127, column: 5, scope: !52)
!70 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 53, type: !19, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!71 = !DILocalVariable(name: "data", scope: !70, file: !9, line: 55, type: !5)
!72 = !DILocation(line: 55, column: 12, scope: !70)
!73 = !DILocalVariable(name: "dataBuffer", scope: !70, file: !9, line: 56, type: !5)
!74 = !DILocation(line: 56, column: 12, scope: !70)
!75 = !DILocation(line: 56, column: 33, scope: !70)
!76 = !DILocation(line: 57, column: 12, scope: !70)
!77 = !DILocation(line: 57, column: 10, scope: !70)
!78 = !DILocation(line: 58, column: 8, scope: !79)
!79 = distinct !DILexicalBlock(scope: !70, file: !9, line: 58, column: 8)
!80 = !DILocation(line: 58, column: 18, scope: !79)
!81 = !DILocation(line: 58, column: 8, scope: !70)
!82 = !DILocation(line: 61, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !9, line: 59, column: 5)
!84 = !DILocation(line: 62, column: 5, scope: !83)
!85 = !DILocation(line: 66, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !79, file: !9, line: 64, column: 5)
!87 = !DILocation(line: 67, column: 9, scope: !86)
!88 = !DILocation(line: 67, column: 20, scope: !86)
!89 = !DILocalVariable(name: "dest", scope: !90, file: !9, line: 70, type: !40)
!90 = distinct !DILexicalBlock(scope: !70, file: !9, line: 69, column: 5)
!91 = !DILocation(line: 70, column: 14, scope: !90)
!92 = !DILocation(line: 72, column: 9, scope: !90)
!93 = !DILocation(line: 73, column: 19, scope: !90)
!94 = !DILocation(line: 73, column: 9, scope: !90)
!95 = !DILocation(line: 75, column: 1, scope: !70)
!96 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 78, type: !19, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!97 = !DILocalVariable(name: "data", scope: !96, file: !9, line: 80, type: !5)
!98 = !DILocation(line: 80, column: 12, scope: !96)
!99 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !9, line: 81, type: !5)
!100 = !DILocation(line: 81, column: 12, scope: !96)
!101 = !DILocation(line: 81, column: 33, scope: !96)
!102 = !DILocation(line: 82, column: 12, scope: !96)
!103 = !DILocation(line: 82, column: 10, scope: !96)
!104 = !DILocation(line: 83, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !96, file: !9, line: 83, column: 8)
!106 = !DILocation(line: 83, column: 18, scope: !105)
!107 = !DILocation(line: 83, column: 8, scope: !96)
!108 = !DILocation(line: 86, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !9, line: 84, column: 5)
!110 = !DILocation(line: 87, column: 9, scope: !109)
!111 = !DILocation(line: 87, column: 20, scope: !109)
!112 = !DILocation(line: 88, column: 5, scope: !109)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !9, line: 90, type: !40)
!114 = distinct !DILexicalBlock(scope: !96, file: !9, line: 89, column: 5)
!115 = !DILocation(line: 90, column: 14, scope: !114)
!116 = !DILocation(line: 92, column: 9, scope: !114)
!117 = !DILocation(line: 93, column: 19, scope: !114)
!118 = !DILocation(line: 93, column: 9, scope: !114)
!119 = !DILocation(line: 95, column: 1, scope: !96)
