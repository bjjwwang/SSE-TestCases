; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_45_goodG2BData = internal global i8* null, align 8, !dbg !10

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_45_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  %call = call i8* @malloc(i64 noundef 50) #7, !dbg !27
  store i8* %call, i8** %data, align 8, !dbg !28
  %0 = load i8*, i8** %data, align 8, !dbg !29
  %cmp = icmp eq i8* %0, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %2 = load i8*, i8** %data, align 8, !dbg !37
  store i8* %2, i8** @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_45_badData, align 8, !dbg !38
  call void @badSink(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_45_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* noundef null), !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 noundef %conv), !dbg !55
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_45_good(), !dbg !57
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_45_bad(), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !63 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_45_badData, align 8, !dbg !66
  store i8* %0, i8** %data, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !67, metadata !DIExpression()), !dbg !72
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !73
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !74
  store i8 0, i8* %arrayidx, align 1, !dbg !75
  %1 = load i8*, i8** %data, align 8, !dbg !76
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !76
  %2 = load i8*, i8** %data, align 8, !dbg !76
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !76
  %call = call i8* @__strcpy_chk(i8* noundef %1, i8* noundef %arraydecay1, i64 noundef %3) #9, !dbg !76
  %4 = load i8*, i8** %data, align 8, !dbg !77
  call void @printLine(i8* noundef %4), !dbg !78
  %5 = load i8*, i8** %data, align 8, !dbg !79
  call void @free(i8* noundef %5), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #6

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i8* null, i8** %data, align 8, !dbg !85
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !86
  store i8* %call, i8** %data, align 8, !dbg !87
  %0 = load i8*, i8** %data, align 8, !dbg !88
  %cmp = icmp eq i8* %0, null, !dbg !90
  br i1 %cmp, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  %2 = load i8*, i8** %data, align 8, !dbg !96
  store i8* %2, i8** @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_45_goodG2BData, align 8, !dbg !97
  call void @goodG2BSink(), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_45_goodG2BData, align 8, !dbg !103
  store i8* %0, i8** %data, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !107
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  %1 = load i8*, i8** %data, align 8, !dbg !110
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !110
  %2 = load i8*, i8** %data, align 8, !dbg !110
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !110
  %call = call i8* @__strcpy_chk(i8* noundef %1, i8* noundef %arraydecay1, i64 noundef %3) #9, !dbg !110
  %4 = load i8*, i8** %data, align 8, !dbg !111
  call void @printLine(i8* noundef %4), !dbg !112
  %5 = load i8*, i8** %data, align 8, !dbg !113
  call void @free(i8* noundef %5), !dbg !114
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_45_badData", scope: !2, file: !12, line: 21, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !9, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7, !8}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_45_goodG2BData", scope: !2, file: !12, line: 22, type: !5, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"PIC Level", i32 2}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"Homebrew clang version 14.0.6"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_45_bad", scope: !12, file: !12, line: 40, type: !21, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 42, type: !5)
!25 = !DILocation(line: 42, column: 12, scope: !20)
!26 = !DILocation(line: 43, column: 10, scope: !20)
!27 = !DILocation(line: 45, column: 20, scope: !20)
!28 = !DILocation(line: 45, column: 10, scope: !20)
!29 = !DILocation(line: 46, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !20, file: !12, line: 46, column: 9)
!31 = !DILocation(line: 46, column: 14, scope: !30)
!32 = !DILocation(line: 46, column: 9, scope: !20)
!33 = !DILocation(line: 46, column: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !12, line: 46, column: 23)
!35 = !DILocation(line: 47, column: 5, scope: !20)
!36 = !DILocation(line: 47, column: 13, scope: !20)
!37 = !DILocation(line: 48, column: 69, scope: !20)
!38 = !DILocation(line: 48, column: 67, scope: !20)
!39 = !DILocation(line: 49, column: 5, scope: !20)
!40 = !DILocation(line: 50, column: 1, scope: !20)
!41 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_45_good", scope: !12, file: !12, line: 83, type: !21, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!42 = !DILocation(line: 85, column: 5, scope: !41)
!43 = !DILocation(line: 86, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 97, type: !45, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!45 = !DISubroutineType(types: !46)
!46 = !{!47, !47, !48}
!47 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !12, line: 97, type: !47)
!50 = !DILocation(line: 97, column: 14, scope: !44)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !12, line: 97, type: !48)
!52 = !DILocation(line: 97, column: 27, scope: !44)
!53 = !DILocation(line: 100, column: 22, scope: !44)
!54 = !DILocation(line: 100, column: 12, scope: !44)
!55 = !DILocation(line: 100, column: 5, scope: !44)
!56 = !DILocation(line: 102, column: 5, scope: !44)
!57 = !DILocation(line: 103, column: 5, scope: !44)
!58 = !DILocation(line: 104, column: 5, scope: !44)
!59 = !DILocation(line: 107, column: 5, scope: !44)
!60 = !DILocation(line: 108, column: 5, scope: !44)
!61 = !DILocation(line: 109, column: 5, scope: !44)
!62 = !DILocation(line: 111, column: 5, scope: !44)
!63 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!64 = !DILocalVariable(name: "data", scope: !63, file: !12, line: 28, type: !5)
!65 = !DILocation(line: 28, column: 12, scope: !63)
!66 = !DILocation(line: 28, column: 19, scope: !63)
!67 = !DILocalVariable(name: "source", scope: !68, file: !12, line: 30, type: !69)
!68 = distinct !DILexicalBlock(scope: !63, file: !12, line: 29, column: 5)
!69 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !70)
!70 = !{!71}
!71 = !DISubrange(count: 100)
!72 = !DILocation(line: 30, column: 14, scope: !68)
!73 = !DILocation(line: 31, column: 9, scope: !68)
!74 = !DILocation(line: 32, column: 9, scope: !68)
!75 = !DILocation(line: 32, column: 23, scope: !68)
!76 = !DILocation(line: 34, column: 9, scope: !68)
!77 = !DILocation(line: 35, column: 19, scope: !68)
!78 = !DILocation(line: 35, column: 9, scope: !68)
!79 = !DILocation(line: 36, column: 14, scope: !68)
!80 = !DILocation(line: 36, column: 9, scope: !68)
!81 = !DILocation(line: 38, column: 1, scope: !63)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 71, type: !21, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!83 = !DILocalVariable(name: "data", scope: !82, file: !12, line: 73, type: !5)
!84 = !DILocation(line: 73, column: 12, scope: !82)
!85 = !DILocation(line: 74, column: 10, scope: !82)
!86 = !DILocation(line: 76, column: 20, scope: !82)
!87 = !DILocation(line: 76, column: 10, scope: !82)
!88 = !DILocation(line: 77, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !12, line: 77, column: 9)
!90 = !DILocation(line: 77, column: 14, scope: !89)
!91 = !DILocation(line: 77, column: 9, scope: !82)
!92 = !DILocation(line: 77, column: 24, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !12, line: 77, column: 23)
!94 = !DILocation(line: 78, column: 5, scope: !82)
!95 = !DILocation(line: 78, column: 13, scope: !82)
!96 = !DILocation(line: 79, column: 73, scope: !82)
!97 = !DILocation(line: 79, column: 71, scope: !82)
!98 = !DILocation(line: 80, column: 5, scope: !82)
!99 = !DILocation(line: 81, column: 1, scope: !82)
!100 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 57, type: !21, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!101 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 59, type: !5)
!102 = !DILocation(line: 59, column: 12, scope: !100)
!103 = !DILocation(line: 59, column: 19, scope: !100)
!104 = !DILocalVariable(name: "source", scope: !105, file: !12, line: 61, type: !69)
!105 = distinct !DILexicalBlock(scope: !100, file: !12, line: 60, column: 5)
!106 = !DILocation(line: 61, column: 14, scope: !105)
!107 = !DILocation(line: 62, column: 9, scope: !105)
!108 = !DILocation(line: 63, column: 9, scope: !105)
!109 = !DILocation(line: 63, column: 23, scope: !105)
!110 = !DILocation(line: 65, column: 9, scope: !105)
!111 = !DILocation(line: 66, column: 19, scope: !105)
!112 = !DILocation(line: 66, column: 9, scope: !105)
!113 = !DILocation(line: 67, column: 14, scope: !105)
!114 = !DILocation(line: 67, column: 9, scope: !105)
!115 = !DILocation(line: 69, column: 1, scope: !100)
